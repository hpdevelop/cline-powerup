---
description: Execute the implementation plan by processing and executing all tasks defined in tasks.md
---

# /speckit/implement — Execute Implementation

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Step 1: Load prerequisites

Run `.specify/scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks` from repo root and parse `FEATURE_DIR` and `AVAILABLE_DOCS`. All paths must be absolute.

For single quotes in args, use escape syntax: e.g. `'I'\'m Groot'`.

## Step 2: Check checklist status

If `FEATURE_DIR/checklists/` exists, scan all checklist files and build a status table:

| Checklist | Total | Completed | Incomplete | Status |
|-----------|-------|-----------|------------|--------|
| ux.md | 12 | 12 | 0 | ✓ PASS |
| security.md | 6 | 4 | 2 | ✗ FAIL |

If any checklist has incomplete items: display the table and **stop**. Ask: "Some checklists are incomplete. Do you want to proceed with implementation anyway? (yes/no)". Wait for user response before continuing.

If all checklists pass: display the table and proceed automatically.

## Step 3: Load implementation context

Read:
- **Required**: `tasks.md` — complete task list and execution plan
- **Required**: `plan.md` — tech stack, architecture, and file structure
- **If exists**: `data-model.md` — entities and relationships
- **If exists**: `contracts/` — API specifications and test requirements
- **If exists**: `research.md` — technical decisions and constraints
- **If exists**: `quickstart.md` — integration scenarios

## Step 4: Verify project setup

Create or verify ignore files based on the actual project tech stack detected from `plan.md`:

```bash
git rev-parse --git-dir 2>/dev/null  # Git repo → verify .gitignore
```

Also check for: Dockerfile → `.dockerignore`, `.eslintrc*` → `.eslintignore`, `.prettierrc*` → `.prettierignore`, `package.json` → `.npmignore`, `*.tf` → `.terraformignore`.

If an ignore file exists: verify it contains essential patterns and append only missing critical patterns. If missing: create it with the full pattern set for the detected technology.

Common patterns:
- **Node.js/TS**: `node_modules/`, `dist/`, `build/`, `*.log`, `.env*`
- **Python**: `__pycache__/`, `*.pyc`, `.venv/`, `dist/`, `*.egg-info/`
- **Go**: `*.exe`, `*.test`, `vendor/`, `*.out`
- **Rust**: `target/`, `debug/`, `release/`, `.env*`
- **Universal**: `.DS_Store`, `*.tmp`, `*.swp`, `.vscode/`, `.idea/`

## Step 5: Parse task plan

Extract from `tasks.md`:
- Task phases (Setup, Foundational, User Stories, Polish)
- Task dependencies (sequential vs parallel)
- Task details: ID, description, file paths, `[P]` markers
- Execution order

## Step 6: Execute phase by phase

Complete each phase before moving to the next:
- **Respect dependencies**: sequential tasks in order; `[P]` tasks can run together
- **Follow TDD if specified**: execute test tasks before corresponding implementation tasks
- **File coordination**: tasks affecting the same files must run sequentially
- **Validation checkpoints**: verify each phase before proceeding

Execution order within phases:
1. Setup — project structure, dependencies, configuration
2. Foundational — shared models, interfaces, infrastructure
3. User Stories — models → services → endpoints/UI → integration (per story)
4. Polish — cross-cutting concerns, documentation

## Step 7: Track progress and handle errors

After each completed task: mark it `[X]` in `tasks.md` and report progress.

On failure:
- Non-parallel task failure: halt execution, report error with context, suggest next steps
- Parallel task `[P]` failure: continue with successful tasks, report failed ones
- If implementation cannot proceed: surface the blocker clearly

## Step 8: Final validation

After all tasks complete:
- Verify all required tasks are marked `[X]`
- Check that implemented features match the original spec
- Validate that tests pass and coverage meets requirements
- Confirm implementation follows the technical plan
- Report final status with summary of completed work

**Note**: If `tasks.md` is incomplete or missing, run `/speckit/tasks` first.

## Next Steps

After completing this workflow, present this option to the user:

1. **`/act/finish-branch`** — Review, commit, and close out the feature branch
