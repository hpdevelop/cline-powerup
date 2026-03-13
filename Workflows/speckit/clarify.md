---
description: Identify underspecified areas in the current feature spec by asking up to 5 highly targeted clarification questions and encoding answers back into the spec.
---

# /speckit/clarify — Resolve Spec Ambiguities

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

**Note**: This workflow is expected to run BEFORE `/speckit/plan`. If the user explicitly skips clarification (e.g., exploratory spike), warn that downstream rework risk increases.

## Step 1: Load prerequisites

Run `.specify/scripts/bash/check-prerequisites.sh --json --paths-only` from repo root **once** and parse:
- `FEATURE_DIR`
- `FEATURE_SPEC`

For single quotes in args, use escape syntax: e.g. `'I'\'m Groot'`. If JSON parsing fails, abort and instruct user to run `/speckit/specify` first.

## Step 2: Scan for ambiguities

Load `FEATURE_SPEC` and perform a structured scan across these categories. Mark each: **Clear / Partial / Missing**.

| Category | Items to check |
|---|---|
| Functional Scope | Core user goals, out-of-scope declarations, user roles |
| Domain & Data | Entities, uniqueness rules, state transitions, data volume |
| Interaction & UX | User journeys, error/empty/loading states, accessibility |
| Non-Functional | Performance targets, scalability limits, reliability, observability, security |
| Integration | External services and failure modes, data formats, versioning |
| Edge Cases | Negative scenarios, rate limiting, conflict resolution |
| Constraints | Technical constraints, explicit tradeoffs |
| Terminology | Canonical glossary terms, avoided synonyms |
| Completion Signals | Testable acceptance criteria, measurable Definition of Done |
| Placeholders | TODO markers, vague adjectives lacking quantification |

Build an internal coverage map for prioritization. Do not output the raw map unless no questions will be asked.

## Step 3: Generate candidate questions

Produce a prioritized queue of up to 5 candidate questions. Apply these constraints:
- Maximum 10 total questions across the whole session
- Each question must be answerable with a multiple-choice selection (2–5 options) OR a short phrase (≤5 words)
- Only include questions whose answers materially impact architecture, data modeling, task decomposition, test design, UX, or compliance
- Prioritize by (Impact × Uncertainty) — cover the highest-impact unresolved categories first
- Exclude questions already answered, trivial stylistic preferences, or plan-level execution details

If no meaningful ambiguities exist, skip to Step 5 and report "No critical ambiguities detected."

## Step 4: Ask questions one at a time

Present **exactly one question at a time**. Never reveal the full queue in advance.

For multiple-choice questions:
- Analyze all options and determine the most suitable one based on best practices, risk reduction, and alignment with project goals
- Lead with: `**Recommended:** Option [X] — <reasoning>`
- Render all options as a Markdown table:

  | Option | Description |
  |--------|-------------|
  | A | ... |
  | B | ... |
  | Short | Provide your own answer (≤5 words) |

- Add: `Reply with the option letter, "yes"/"recommended" to accept the recommendation, or a short answer.`

For short-answer questions:
- Provide: `**Suggested:** <proposed answer> — <brief reasoning>`
- Add: `Format: short answer (≤5 words). Say "yes"/"suggested" to accept.`

After each answer: record it in memory, then immediately apply it to the spec (see Step 5). Stop asking when:
- All critical ambiguities are resolved, OR
- User signals completion ("done", "good", "no more"), OR
- 5 questions have been asked

## Step 5: Update the spec after each accepted answer

Apply clarifications incrementally — save after each one:

- Ensure a `## Clarifications` section exists (just after the overview section)
- Under it, maintain a `### Session YYYY-MM-DD` subheading
- Append: `- Q: <question> → A: <final answer>`
- Apply the clarification to the most appropriate section:
  - Functional ambiguity → Functional Requirements
  - UX / actor distinction → User Stories or Actors
  - Data shape → Data Model (add fields, types, relationships)
  - Non-functional constraint → Quality Attributes (convert vague adjective to metric)
  - Edge case → Edge Cases / Error Handling
  - Terminology conflict → normalize term across spec
- Replace invalidated statements; do not leave contradictory text
- Preserve formatting: do not reorder unrelated sections

Validation after each write:
- One bullet per accepted answer, no duplicates
- ≤5 questions asked total
- No lingering vague placeholders the answer was meant to resolve
- No contradictory earlier statement remains
- Markdown structure valid; only new headings allowed: `## Clarifications`, `### Session YYYY-MM-DD`

## Step 6: Write the final spec

After the questioning loop ends, write the fully updated spec back to `FEATURE_SPEC`.

## Step 7: Report completion

Output:
- Number of questions asked and answered
- Path to updated spec
- Sections touched
- Coverage summary table:

  | Category | Status |
  |---|---|
  | Functional Scope | Resolved / Deferred / Clear / Outstanding |
  | ... | ... |

If Outstanding or Deferred categories remain, recommend whether to proceed to `/speckit/plan` or run `/speckit/clarify` again post-plan.

## Next Steps

After completing this workflow, present this option to the user:

1. **`/speckit/plan`** — Proceed to technical planning now that ambiguities are resolved
