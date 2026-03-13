#!/usr/bin/env bash
#
# enhance-all.sh — Run /enhance workflow on every git repository found under a root path.
#
# Usage:
#   ./scripts/enhance-all.sh <root-path> [--depth N] [--timeout S]
#
# Arguments:
#   root-path       Directory to search for git repositories (required)
#
# Options:
#   --depth N       Search depth for finding repos (default: 1)
#   --timeout S     Cline timeout in seconds per repo (default: 300)
#
# Examples:
#   ./scripts/enhance-all.sh ~/projects
#   ./scripts/enhance-all.sh ~/projects --depth 2 --timeout 600

set -euo pipefail

# ── Defaults ──────────────────────────────────────────────────────────────────
DEPTH=1
TIMEOUT=300
ROOT_PATH=""

# ── Parse arguments ───────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --depth)
            DEPTH="$2"
            shift 2
            ;;
        --timeout)
            TIMEOUT="$2"
            shift 2
            ;;
        --help|-h)
            sed -n '2,15p' "$0" | sed 's/^# \{0,1\}//'
            exit 0
            ;;
        -*)
            echo "ERROR: Unknown option '$1'. Use --help for usage." >&2
            exit 1
            ;;
        *)
            if [[ -z "$ROOT_PATH" ]]; then
                ROOT_PATH="$1"
            else
                echo "ERROR: Unexpected argument '$1'." >&2
                exit 1
            fi
            shift
            ;;
    esac
done

# ── Validate root path ────────────────────────────────────────────────────────
if [[ -z "$ROOT_PATH" ]]; then
    echo "ERROR: root-path is required." >&2
    echo "Usage: $0 <root-path> [--depth N] [--timeout S]" >&2
    exit 1
fi

if [[ ! -d "$ROOT_PATH" ]]; then
    echo "ERROR: Directory not found: $ROOT_PATH" >&2
    exit 1
fi

ROOT_PATH="$(cd "$ROOT_PATH" && pwd)"

# ── Require cline ─────────────────────────────────────────────────────────────
if ! command -v npx &>/dev/null; then
    echo "ERROR: npx not found. Install Node.js to use the cline CLI." >&2
    exit 1
fi

# ── Discover git repositories ─────────────────────────────────────────────────
echo "Searching for git repositories in: $ROOT_PATH (depth=$DEPTH)"
echo ""

mapfile -t REPOS < <(
    find "$ROOT_PATH" \
        -mindepth 1 -maxdepth "$DEPTH" \
        -type d -name ".git" \
        | sed 's|/\.git$||' \
        | sort
)

if [[ ${#REPOS[@]} -eq 0 ]]; then
    echo "No git repositories found under $ROOT_PATH at depth $DEPTH."
    exit 0
fi

echo "Found ${#REPOS[@]} repositor$([ ${#REPOS[@]} -eq 1 ] && echo y || echo ies):"
for repo in "${REPOS[@]}"; do
    echo "  - $repo"
done
echo ""

# ── Run /enhance on each repo ─────────────────────────────────────────────────
PASS=()
FAIL=()
SKIP=()

for repo in "${REPOS[@]}"; do
    repo_name="$(basename "$repo")"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "▶  $repo_name"
    echo "   $repo"
    echo ""

    # Check for enhance.md workflow
    workflow_file="$repo/Workflows/enhance.md"
    if [[ ! -f "$workflow_file" ]]; then
        echo "   SKIP — Workflows/enhance.md not found in this repo."
        SKIP+=("$repo_name")
        echo ""
        continue
    fi

    if npx cline -y -a --timeout "$TIMEOUT" --cwd "$repo" "/enhance" ; then
        echo ""
        echo "   ✓ PASS"
        PASS+=("$repo_name")
    else
        echo ""
        echo "   ✗ FAIL (exit code $?)"
        FAIL+=("$repo_name")
    fi
    echo ""
done

# ── Summary ───────────────────────────────────────────────────────────────────
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Summary"
echo ""
echo "  Total : ${#REPOS[@]}"
echo "  Pass  : ${#PASS[@]}"
echo "  Fail  : ${#FAIL[@]}"
echo "  Skip  : ${#SKIP[@]}"
echo ""

if [[ ${#PASS[@]} -gt 0 ]]; then
    echo "Passed:"
    for r in "${PASS[@]}"; do echo "  ✓ $r"; done
    echo ""
fi

if [[ ${#FAIL[@]} -gt 0 ]]; then
    echo "Failed:"
    for r in "${FAIL[@]}"; do echo "  ✗ $r"; done
    echo ""
fi

if [[ ${#SKIP[@]} -gt 0 ]]; then
    echo "Skipped:"
    for r in "${SKIP[@]}"; do echo "  - $r"; done
    echo ""
fi

if [[ ${#FAIL[@]} -gt 0 ]]; then
    exit 1
fi
