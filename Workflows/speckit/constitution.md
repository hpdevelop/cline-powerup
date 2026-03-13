---
description: Create or update the project constitution from interactive or provided principle inputs, ensuring all dependent templates stay in sync.
---

# /speckit/constitution — Update Project Constitution

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

**Scope**: You are updating `.specify/memory/constitution.md`. This file contains placeholder tokens in square brackets (e.g. `[PROJECT_NAME]`, `[PRINCIPLE_1_NAME]`). Your job is to collect concrete values, fill the template precisely, and propagate any amendments across dependent artifacts.

If `.specify/memory/constitution.md` does not exist, copy from `.specify/templates/constitution-template.md` first.

## Step 1: Load existing constitution

Read `.specify/memory/constitution.md`. Identify every placeholder token of the form `[ALL_CAPS_IDENTIFIER]`.

Note: the user may require fewer or more principles than the template provides — respect any count specified and adjust the document accordingly.

## Step 2: Collect values for placeholders

For each placeholder:
- If user input supplies a value, use it
- Otherwise infer from repo context (README, docs, prior constitution versions)

For governance dates:
- `RATIFICATION_DATE` — original adoption date (ask or mark TODO if unknown)
- `LAST_AMENDED_DATE` — today's date if changes are made, otherwise keep previous

For `CONSTITUTION_VERSION`, increment using semantic versioning:
- **MAJOR**: Backward-incompatible governance changes, principle removals or redefinitions
- **MINOR**: New principle or section added, materially expanded guidance
- **PATCH**: Clarifications, wording, typo fixes, non-semantic refinements

If version bump type is ambiguous, propose reasoning before finalizing.

## Step 3: Draft the updated constitution

Replace every placeholder with concrete text — no bracketed tokens should remain (except intentionally deferred slots, which must be explicitly justified).

For each Principle section:
- Succinct name line
- Paragraph or bullet list of non-negotiable rules
- Explicit rationale if not obvious

For the Governance section:
- Amendment procedure
- Versioning policy
- Compliance review expectations

Principles must be declarative and testable. Replace vague language: "should" → MUST or SHOULD with clear rationale. Replace vague adjectives with measurable criteria.

## Step 4: Propagate changes to dependent templates

Read each dependent file and update any references to changed or removed principles:

- `.specify/templates/plan-template.md` — verify "Constitution Check" section aligns with updated principles
- `.specify/templates/spec-template.md` — verify scope/requirements alignment; update if mandatory sections changed
- `.specify/templates/tasks-template.md` — verify task categories reflect new or removed principle-driven task types (observability, testing discipline, versioning)
- `.specify/templates/commands/*.md` — verify no outdated agent-specific references remain
- `README.md` and any `docs/` guidance files — update principle references

## Step 5: Produce Sync Impact Report

Prepend an HTML comment at the top of the updated constitution file:

```html
<!--
SYNC IMPACT REPORT — vOLD → vNEW (YYYY-MM-DD)
Modified principles: [old title → new title]
Added sections: [list]
Removed sections: [list]
Templates updated:
  ✅ .specify/templates/plan-template.md
  ⚠ .specify/templates/spec-template.md (pending manual review)
Deferred TODOs: [list any intentionally deferred placeholders]
-->
```

## Step 6: Validate before writing

Check:
- No unexplained bracket tokens remain
- Version line matches the Sync Impact Report
- Dates are in ISO format `YYYY-MM-DD`
- Principles are declarative, testable, and free of vague language
- If critical info is missing (e.g., ratification date truly unknown), insert `TODO(<FIELD_NAME>): explanation`

## Step 7: Write the completed constitution

Overwrite `.specify/memory/constitution.md` with the updated content.

## Step 8: Report completion

Output:
- New version number and bump rationale
- Summary of principle changes
- Files updated and any flagged for manual follow-up
- Suggested commit message: `docs: amend constitution to vX.Y.Z (<summary of changes>)`

## Next Steps

After completing this workflow, present this option to the user:

1. **`/speckit/specify`** — Start a feature specification guided by the updated constitution
