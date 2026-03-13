#!/usr/bin/env bash
# setup.sh — Install cline-powerup skills, workflows, and rules into a target project
#
# Usage:
#   ./setup.sh <target-path>            # interactive install
#   ./setup.sh <target-path> --dry-run  # preview without writing
#   ./setup.sh --global                 # install skills globally only (~/.cline/skills)
#
# What gets installed:
#   Skills/      → ~/.cline/skills/                  (global, available in all projects)
#   Workflows/   → <target>/.clinerules/workflows/   (project-level workflows)
#   .clinerules/ → <target>/.clinerules/             (TDD, SOLID, governance — always-active)

set -euo pipefail

# ── Colours ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

ok()   { echo -e "${GREEN}  ✔${RESET}  $*"; }
info() { echo -e "${CYAN}  →${RESET}  $*"; }
warn() { echo -e "${YELLOW}  ⚠${RESET}  $*"; }
err()  { echo -e "${RED}  ✖${RESET}  $*" >&2; }
h1()   { echo -e "\n${BOLD}${BLUE}$*${RESET}"; }

# ── Source directory (where this script lives) ────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Parse arguments ───────────────────────────────────────────────────────────
TARGET=""
DRY_RUN=false
GLOBAL_ONLY=false

for arg in "$@"; do
  case "$arg" in
    --dry-run)    DRY_RUN=true ;;
    --global)     GLOBAL_ONLY=true ;;
    --help|-h)
      echo "Usage: $0 <target-path> [--dry-run]"
      echo "       $0 --global [--dry-run]"
      exit 0 ;;
    -*)
      err "Unknown option: $arg"; exit 1 ;;
    *)
      if [[ -z "$TARGET" ]]; then TARGET="$arg"
      else err "Unexpected argument: $arg"; exit 1; fi ;;
  esac
done

# ── Validate inputs ───────────────────────────────────────────────────────────
if [[ "$GLOBAL_ONLY" == false && -z "$TARGET" ]]; then
  err "Target path is required."
  echo "  Usage: $0 <target-path> [--dry-run]"
  echo "  Or:    $0 --global [--dry-run]"
  exit 1
fi

if [[ "$GLOBAL_ONLY" == false ]]; then
  TARGET="$(realpath "$TARGET" 2>/dev/null || echo "$TARGET")"
  if [[ ! -d "$TARGET" ]]; then
    err "Target directory does not exist: $TARGET"
    exit 1
  fi
fi

GLOBAL_SKILLS_DIR="$HOME/.cline/skills"

# ── Dry-run wrapper ───────────────────────────────────────────────────────────
# All filesystem mutations go through these helpers so --dry-run is clean.
do_mkdir() {
  if [[ "$DRY_RUN" == true ]]; then info "[dry-run] mkdir -p $1"
  else mkdir -p "$1"; fi
}

do_copy() {
  local src="$1" dst="$2"
  if [[ "$DRY_RUN" == true ]]; then
    info "[dry-run] cp -R $src  →  $dst"
  else
    mkdir -p "$(dirname "$dst")"
    cp -R "$src" "$dst"
  fi
}

do_backup_copy() {
  # Copy src → dst, backing up dst first if it already exists
  local src="$1" dst="$2"
  if [[ "$DRY_RUN" == true ]]; then
    info "[dry-run] cp -R $src  →  $dst"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" ]]; then
    local bak="${dst}.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$bak"
    warn "Backed up existing $(basename "$dst") → $(basename "$bak")"
  fi
  cp -R "$src" "$dst"
}

# ── Banner ────────────────────────────────────────────────────────────────────
echo -e "\n${BOLD}${CYAN}cline-powerup setup${RESET}"
echo    "  Source : $SCRIPT_DIR"
if [[ "$GLOBAL_ONLY" == true ]]; then
  echo  "  Mode   : global skills only"
else
  echo  "  Target : $TARGET"
fi
[[ "$DRY_RUN" == true ]] && echo -e "  ${YELLOW}DRY RUN — no files will be written${RESET}"

# ── 1. Skills → ~/.cline/skills/ ─────────────────────────────────────────────
h1 "Step 1: Skills  →  $GLOBAL_SKILLS_DIR"

SKILLS_SRC="$SCRIPT_DIR/Skills"
if [[ ! -d "$SKILLS_SRC" ]]; then
  warn "Skills/ directory not found in source — skipping"
else
  do_mkdir "$GLOBAL_SKILLS_DIR"

  installed=0; skipped=0
  for skill_dir in "$SKILLS_SRC"/*/; do
    skill_name="$(basename "$skill_dir")"
    dst="$GLOBAL_SKILLS_DIR/$skill_name"

    # Detect the skill entry point for display
    md_count=$(find "$skill_dir" -maxdepth 1 -name "*.md" | wc -l | tr -d ' ')
    if   [[ -f "$skill_dir/SKILL.md" ]];  then entry="SKILL.md"
    elif [[ -f "$skill_dir/index.md" ]];  then entry="index.md"
    elif [[ "$md_count" -eq 1 ]];         then entry="$(basename "$(find "$skill_dir" -maxdepth 1 -name "*.md")")"
    else entry="$md_count markdown files"; fi

    if [[ -d "$dst" ]]; then
      # Skill already exists — overwrite after backup
      do_backup_copy "$skill_dir" "$dst"
      ok "Updated  : $skill_name  [$entry]"
    else
      do_copy "$skill_dir" "$dst"
      ok "Installed: $skill_name  [$entry]"
    fi
    (( installed++ )) || true
  done

  info "$installed skill(s) processed"
fi

[[ "$GLOBAL_ONLY" == true ]] && { echo; ok "Global install complete."; exit 0; }

# ── 2. Workflows → <target>/.clinerules/workflows/ ───────────────────────────
h1 "Step 2: Workflows  →  $TARGET/.clinerules/workflows"

WORKFLOWS_SRC="$SCRIPT_DIR/Workflows"
WORKFLOWS_DST="$TARGET/.clinerules/workflows"
if [[ ! -d "$WORKFLOWS_SRC" ]]; then
  warn "Workflows/ directory not found in source — skipping"
else
  do_mkdir "$WORKFLOWS_DST"

  # Copy top-level .md files
  for wf in "$WORKFLOWS_SRC"/*.md; do
    [[ -f "$wf" ]] || continue
    name="$(basename "$wf")"
    [[ "$name" == "example-workflow.md" ]] && continue  # reference only
    do_backup_copy "$wf" "$WORKFLOWS_DST/$name"
    ok "Workflow : $name"
  done

  # Copy subdirectory workflow groups (act/, plan/, speckit/)
  for wf_dir in "$WORKFLOWS_SRC"/*/; do
    [[ -d "$wf_dir" ]] || continue
    dir_name="$(basename "$wf_dir")"
    count=$(find "$wf_dir" -name "*.md" | wc -l | tr -d ' ')
    dst_dir="$WORKFLOWS_DST/$dir_name"
    if [[ -d "$dst_dir" ]]; then
      do_backup_copy "$wf_dir" "$dst_dir"
      ok "Updated  : .clinerules/workflows/$dir_name/  ($count files)"
    else
      do_copy "$wf_dir" "$dst_dir"
      ok "Installed: .clinerules/workflows/$dir_name/  ($count files)"
    fi
  done
fi

# ── 3. .clinerules/ → <target>/.clinerules/ ──────────────────────────────────
h1 "Step 3: Rules  →  $TARGET/.clinerules"

RULES_SRC="$SCRIPT_DIR/.clinerules"
if [[ ! -d "$RULES_SRC" ]]; then
  warn ".clinerules/ directory not found in source — skipping"
else
  do_mkdir "$TARGET/.clinerules"

  for rule in "$RULES_SRC"/*.md; do
    [[ -f "$rule" ]] || continue
    name="$(basename "$rule")"
    dst="$TARGET/.clinerules/$name"
    if [[ -f "$dst" ]]; then
      do_backup_copy "$rule" "$dst"
      ok "Updated  : .clinerules/$name"
    else
      do_copy "$rule" "$dst"
      ok "Installed: .clinerules/$name"
    fi
  done
fi

# ── Summary ───────────────────────────────────────────────────────────────────
h1 "Done"
if [[ "$DRY_RUN" == true ]]; then
  warn "Dry run — no files were written. Remove --dry-run to apply."
else
  echo -e "  ${GREEN}${BOLD}Installation complete.${RESET}"
  echo
  echo -e "  ${BOLD}What was installed:${RESET}"
  echo    "    Skills    → $GLOBAL_SKILLS_DIR"
  echo    "    Workflows → $TARGET/.clinerules/workflows/"
  echo    "    Rules     → $TARGET/.clinerules/  (TDD, SOLID, governance)"
  echo
  echo -e "  ${BOLD}Next steps:${RESET}"
  echo    "    1. Open your project in VS Code with the Cline extension"
  echo    "    2. Skills are available globally across all projects"
  echo    "    3. Invoke workflows with /workflow-name or /subdir/workflow-name"
  echo    "    4. Rules in .clinerules/ are always-active for this project"
fi
echo
