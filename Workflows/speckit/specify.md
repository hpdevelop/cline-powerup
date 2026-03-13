---
description: Create or update the feature specification from a natural language feature description.
---

# /speckit/specify — Create Feature Specification

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty). The text after `/speckit/specify` **is** the feature description — do not ask the user to repeat it.

## Step 1: Generate a branch short name

Analyze the feature description and create a 2-4 word short name:
- Use action-noun format when possible (e.g., `user-auth`, `analytics-dashboard`)
- Preserve technical terms and acronyms (OAuth2, API, JWT)
- Keep it concise but descriptive

Examples:
- "Add user authentication" → `user-auth`
- "Implement OAuth2 integration for the API" → `oauth2-api-integration`
- "Fix payment processing timeout bug" → `fix-payment-timeout`

## Step 2: Find the next branch number

Fetch remote branches and check all three sources for existing branches with this short name:

```bash
git fetch --all --prune
git ls-remote --heads origin | grep -E 'refs/heads/[0-9]+-<short-name>$'
git branch | grep -E '^[* ]*[0-9]+-<short-name>$'
```

Also check `specs/` for directories matching `specs/[0-9]+-<short-name>`. Find the highest number N across all sources — use N+1 for the new branch. If none found, start at 1.

## Step 3: Create the feature branch and spec file

Run `.specify/scripts/bash/create-new-feature.sh --json` once with the calculated number and short name:

```bash
.specify/scripts/bash/create-new-feature.sh --json --number <N+1> --short-name "<short-name>" "<feature description>"
```

For single quotes in args, use escape syntax: e.g. `'I'\'m Groot'`. Parse JSON output for `BRANCH_NAME` and `SPEC_FILE` — use these exact paths going forward. **Run this script exactly once.**

## Step 4: Load the spec template

Read `.specify/templates/spec-template.md` to understand required sections.

## Step 5: Write the specification

Extract key concepts from the feature description (actors, actions, data, constraints). Fill in the spec template:

- **Functional Requirements**: Each must be testable
- **User Scenarios**: Cover primary flows; ERROR if no clear user flow exists
- **Success Criteria**: Measurable, technology-agnostic outcomes (time, percentage, count)
- **Assumptions**: Document reasonable defaults used where user did not specify

For unclear aspects, make informed guesses based on context and industry standards. Use `[NEEDS CLARIFICATION: specific question]` markers **only** when:
- The choice significantly impacts feature scope or user experience
- Multiple reasonable interpretations exist with different implications
- No reasonable default exists

**Limit: maximum 3 `[NEEDS CLARIFICATION]` markers total.**

Reasonable defaults (never ask about these): data retention per industry standard, standard performance targets, user-friendly error handling, standard auth patterns.

Write the completed spec to `SPEC_FILE`.

## Step 6: Validate specification quality

Create `FEATURE_DIR/checklists/requirements.md` with quality validation items:

**Content Quality**: No implementation details, focused on user value, written for non-technical stakeholders, all mandatory sections completed.

**Requirement Completeness**: Requirements are testable and unambiguous, success criteria are measurable and technology-agnostic, edge cases identified, scope clearly bounded.

**Feature Readiness**: All functional requirements have acceptance criteria, user scenarios cover primary flows.

Review the spec against each item. If items fail, update the spec and re-validate (max 3 iterations). If `[NEEDS CLARIFICATION]` markers remain, present them as a structured question table (max 3 questions):

```markdown
## Question [N]: [Topic]

**Context**: [Quote relevant spec section]
**What we need to know**: [Specific question]

| Option | Answer | Implications |
|--------|--------|--------------|
| A      | ...    | ...          |
| B      | ...    | ...          |
| Custom | Provide your own | ...   |
```

Present all questions together, wait for responses, then update the spec with answers. Re-run validation after all clarifications are resolved.

## Step 7: Report completion

Output:
- Branch name and spec file path
- Checklist results (pass/fail per item)
- Readiness for next phase

## Next Steps

After completing this workflow, present these options to the user and wait for their choice:

1. **`/speckit/clarify`** — Resolve ambiguities in the spec before planning (recommended if `[NEEDS CLARIFICATION]` markers remain)
2. **`/speckit/plan`** — Proceed directly to technical planning if the spec is complete
