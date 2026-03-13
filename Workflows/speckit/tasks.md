---
description: Generate an actionable, dependency-ordered tasks.md for the feature based on available design artifacts.
---

# /speckit/tasks — Generate Task List

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Step 1: Setup

Run `.specify/scripts/bash/check-prerequisites.sh --json` from repo root and parse JSON for `FEATURE_DIR` and `AVAILABLE_DOCS`. All paths must be absolute.

For single quotes in args, use escape syntax: e.g. `'I'\'m Groot'`.

## Step 2: Load design documents

Read from `FEATURE_DIR`:
- **Required**: `plan.md` (tech stack, libraries, project structure), `spec.md` (user stories with priorities)
- **Optional if exists**: `data-model.md` (entities), `contracts/` (interface contracts), `research.md` (decisions), `quickstart.md` (test scenarios)

Not all projects have all documents — generate tasks based on what's available.

## Step 3: Map tasks to user stories

Extract user stories with priorities (P1, P2, P3) from `spec.md`. For each user story, identify:
- Models needed for that story
- Services needed for that story
- Interfaces/UI needed for that story
- Tests for that story (only if requested in spec or user requests TDD)

Map entities from `data-model.md` to their user stories. Map interface contracts from `contracts/` to the user story each serves. Extract shared infrastructure and foundational tasks.

Generate a dependency graph showing user story completion order and parallel execution opportunities per story.

## Step 4: Write tasks.md

Use `.specify/templates/tasks-template.md` as the structure. Fill with:

**Phase structure**:
- **Phase 1 — Setup**: Project initialization, tooling
- **Phase 2 — Foundational**: Blocking prerequisites for all user stories (must complete before Phase 3+)
- **Phase 3+ — User Stories**: One phase per story in priority order (P1 first)
  - Within each story: Tests (if requested) → Models → Services → Endpoints/UI → Integration
  - Each phase must be a complete, independently testable increment
- **Final Phase — Polish**: Cross-cutting concerns, documentation

**Every task MUST follow this checklist format**:

```text
- [ ] [TaskID] [P?] [Story?] Description with exact file path
```

Format rules:
1. `- [ ]` checkbox — always required
2. `T001, T002...` sequential ID in execution order
3. `[P]` marker — include only if task is parallelizable (different files, no incomplete dependencies)
4. `[US1], [US2]...` story label — required for user story phases only; omit for Setup, Foundational, Polish phases
5. Description with the exact target file path

Examples:
- ✅ `- [ ] T001 Create project structure per implementation plan`
- ✅ `- [ ] T005 [P] Implement auth middleware in src/middleware/auth.py`
- ✅ `- [ ] T012 [P] [US1] Create User model in src/models/user.py`
- ❌ `- [ ] Create User model` (missing ID and story label)
- ❌ `T001 [US1] Create model` (missing checkbox)
- ❌ `- [ ] T001 [US1] Create model` (missing file path)

## Step 5: Report completion

Output:
- Path to generated `tasks.md`
- Total task count and count per user story
- Parallel opportunities identified
- Independent test criteria per story
- Suggested MVP scope (typically User Story 1 only)
- Format validation: confirm all tasks follow the checklist format

## Next Steps

After completing this workflow, present these options to the user and wait for their choice:

1. **`/speckit/analyze`** — Run a consistency check across spec, plan, and tasks (recommended)
2. **`/speckit/implement`** — Start implementation directly if you are confident in task completeness
