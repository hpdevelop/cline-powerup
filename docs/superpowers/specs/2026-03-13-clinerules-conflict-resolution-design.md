# Design: .clinerules Conflict Resolution

**Date**: 2026-03-13
**Status**: Approved

## Problem

Four files in `.clinerules/` contain three issues:

| # | Type | Files | Description |
|---|------|-------|-------------|
| 1 | Conflict | `memory-bank.md`, `03-agents.md` | Two competing mandatory start-of-task actions with no defined priority |
| 2 | Redundancy | `01-tdd.md`, `Workflows/act/tdd.md` | Evidence recording detail appears in both the rule and the workflow |
| 3 | Gap | `01-tdd.md`, `03-agents.md` | TDD rule is absolute with no fallback clause; governance charter defines a fallback mechanism |

## Approach

**A — Trim `01-tdd.md` to principles, delete `memory-bank.md`.**

Rules state invariants. Workflows state procedure. Keep them separate.

## Changes

### 1. Delete `.clinerules/memory-bank.md`

Eliminates the start-of-task conflict. The file is an unadapted generic template — the memory system it references (`projectbrief.md`, `productContext.md`, etc.) does not exist in this repo. Memory integration for Cline is deferred to a future dedicated discussion.

### 2. Edit `.clinerules/01-tdd.md`

**Remove**: the evidence-recording line (`Record test evidence: command run, failing output (RED), passing output (GREEN).`) — this is workflow procedure, not a rule invariant. It belongs in `Workflows/act/tdd.md`, where it already lives.

**Add**: one fallback pointer — `When TDD cannot be applied, follow the Guarded Fallback in 03-agents.md.`

**Final content**:

```markdown
# Test-Driven Development

Write a failing test before writing any production code.
Follow RED → GREEN → REFACTOR strictly. One behavior per cycle.
No production code before a failing test is observed.
Re-run all relevant tests after each change.
Add a regression test before any completion claim.
When TDD cannot be applied, follow the Guarded Fallback in 03-agents.md.
```

### 3. No changes to `02-solid.md` or `03-agents.md`

Both are clean. `02-solid.md` is standalone with no conflicts. `03-agents.md` already defines the Guarded Fallback that `01-tdd.md` will now reference.

## Files Unchanged

- `.clinerules/02-solid.md`
- `.clinerules/03-agents.md`
- All workflows under `.clinerules/workflows/`
