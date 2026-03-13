---
description: Execute the implementation planning workflow using the plan template to generate design artifacts.
---

# /speckit/plan — Generate Implementation Plan

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Step 1: Setup

Run `.specify/scripts/bash/setup-plan.sh --json` from repo root and parse JSON for:
- `FEATURE_SPEC` — path to the feature spec
- `IMPL_PLAN` — path to the plan template (already copied)
- `SPECS_DIR` — root specs directory
- `BRANCH` — current feature branch

For single quotes in args, use escape syntax: e.g. `'I'\'m Groot'`.

## Step 2: Load context

Read:
- `FEATURE_SPEC` — feature requirements and scope
- `.specify/memory/constitution.md` — project principles and governance
- `IMPL_PLAN` template — structure to fill in

Fill the Technical Context section. Mark any unknowns as `NEEDS CLARIFICATION`. Fill the Constitution Check section from the constitution. ERROR if any constitution violations are unjustified.

## Step 3: Research unknowns (Phase 0)

For each `NEEDS CLARIFICATION` in Technical Context, create a research task:
- `Research <unknown> for <feature context>`
- `Find best practices for <tech> in <domain>`
- `Evaluate patterns for <integration>`

Dispatch research and consolidate findings in `FEATURE_DIR/research.md`:
```
Decision: [what was chosen]
Rationale: [why chosen]
Alternatives considered: [what else evaluated]
```

All `NEEDS CLARIFICATION` markers must be resolved before proceeding. ERROR if any remain.

## Step 4: Design artifacts (Phase 1)

**Prerequisites**: `research.md` complete.

Extract entities from the feature spec and write `FEATURE_DIR/data-model.md`:
- Entity name, fields, relationships
- Validation rules from requirements
- State transitions (if applicable)

Define interface contracts in `FEATURE_DIR/contracts/` (if the project exposes external interfaces):
- Public APIs for libraries, CLI command schemas, web service endpoints, UI contracts
- Skip if the project is purely internal (build scripts, one-off tools)

## Step 5: Update agent context

Run `.specify/scripts/bash/update-agent-context.sh codex` to update the AI agent's context file with the new technology choices from this plan. Preserve manual additions between markers.

## Step 6: Re-validate against constitution

Re-run the Constitution Check post-design. ERROR if any principle violations introduced during planning are unjustified. Document any justified exceptions with explicit rationale.

## Step 7: Report completion

Output:
- Current branch name
- Path to `IMPL_PLAN`
- List of generated artifacts: `research.md`, `data-model.md`, `contracts/`, agent context file
- Any open TODOs requiring follow-up

## Next Steps

After completing this workflow, present these options to the user and wait for their choice:

1. **`/speckit/tasks`** — Generate the dependency-ordered task list (recommended)
2. **`/speckit/checklist`** — Generate a requirements checklist before tasking
