#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

FILES=("Rules/AGENTS.md" "Workflows/superpowers-dev.md")
while IFS= read -r f; do FILES+=("$f"); done < <(find Skills -maxdepth 2 -name 'SKILL.md' | sort)
while IFS= read -r f; do FILES+=("$f"); done < <(find Skills/subagent-driven-development -maxdepth 1 -name '*-prompt.md' | sort)

PATTERNS=(
  "TodoWrite"
  "Task tool"
  "In Claude Code"
  "For Claude:"
  "EnterPlanMode"
  "ExitPlanMode"
)

failed=0
for p in "${PATTERNS[@]}"; do
  if rg -n --fixed-strings "$p" "${FILES[@]}" >/tmp/gov_hits.txt 2>/dev/null; then
    echo "[FAIL] disallowed term found: $p"
    cat /tmp/gov_hits.txt
    failed=1
  fi
done

rm -f /tmp/gov_hits.txt

if [[ $failed -ne 0 ]]; then
  echo "Governance alignment check failed."
  exit 1
fi

echo "Governance alignment check passed."
