---
description: Perform a non-destructive cross-artifact consistency and quality analysis across spec.md, plan.md, and tasks.md after task generation.
---

# /speckit/analyze — Consistency Analysis

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

**STRICTLY READ-ONLY**: Do not modify any files. Output a structured analysis report only.

**Constitution Authority**: The project constitution (`.specify/memory/constitution.md`) is non-negotiable. Constitution conflicts are automatically CRITICAL and require adjustment of spec, plan, or tasks — not silent ignoring. Changes to the constitution itself must happen in a separate `/speckit/constitution` invocation.

## Step 1: Initialize analysis context

Run `.specify/scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks` once from repo root and parse JSON for FEATURE_DIR and AVAILABLE_DOCS. Derive absolute paths:

- SPEC = FEATURE_DIR/spec.md
- PLAN = FEATURE_DIR/plan.md
- TASKS = FEATURE_DIR/tasks.md

Abort with an error message if any required file is missing.
For single quotes in args, use escape syntax: e.g `'I'\''m Groot'`.

## Step 2: Load artifacts

Load only the minimal necessary context from each artifact:

**From spec.md:** Overview, Functional Requirements, Non-Functional Requirements, User Stories, Edge Cases.

**From plan.md:** Architecture/stack choices, Data Model references, Phases, Technical constraints.

**From tasks.md:** Task IDs, Descriptions, Phase grouping, Parallel markers [P], Referenced file paths.

**From constitution:** Load `.specify/memory/constitution.md` for principle validation.

## Step 3: Build semantic models

Create internal representations (do not include raw artifacts in output):

- **Requirements inventory**: Each functional + non-functional requirement with a stable key
- **User story inventory**: Discrete user actions with acceptance criteria
- **Task coverage mapping**: Map each task to one or more requirements or stories
- **Constitution rule set**: Extract principle names and MUST/SHOULD normative statements

## Step 4: Run detection passes

Focus on high-signal findings. Limit to 50 findings total; aggregate remainder in overflow summary.

**A. Duplication** — Identify near-duplicate requirements; mark lower-quality phrasing for consolidation.

**B. Ambiguity** — Flag vague adjectives (fast, scalable, secure, intuitive, robust) lacking measurable criteria. Flag unresolved placeholders (TODO, TKTK, ???).

**C. Underspecification** — Requirements with verbs but missing object or measurable outcome. Tasks referencing files or components not defined in spec/plan.

**D. Constitution alignment** — Any requirement or plan element conflicting with a MUST principle. Missing mandated sections or quality gates.

**E. Coverage gaps** — Requirements with zero associated tasks. Tasks with no mapped requirement. Non-functional requirements not reflected in tasks.

**F. Inconsistency** — Terminology drift across files. Data entities referenced in plan but absent in spec. Task ordering contradictions. Conflicting requirements.

## Step 5: Assign severity

- **CRITICAL**: Violates constitution MUST, missing core spec artifact, or requirement with zero coverage blocking baseline functionality
- **HIGH**: Duplicate or conflicting requirement, ambiguous security/performance attribute, untestable acceptance criterion
- **MEDIUM**: Terminology drift, missing non-functional task coverage, underspecified edge case
- **LOW**: Style/wording improvements, minor redundancy not affecting execution order

## Step 6: Produce analysis report

Output a Markdown report (no file writes) with this structure:

```
## Specification Analysis Report

| ID | Category | Severity | Location(s) | Summary | Recommendation |
|----|----------|----------|-------------|---------|----------------|

**Coverage Summary Table:**
| Requirement Key | Has Task? | Task IDs | Notes |

**Constitution Alignment Issues:** (if any)

**Unmapped Tasks:** (if any)

**Metrics:**
- Total Requirements
- Total Tasks
- Coverage % (requirements with >=1 task)
- Ambiguity Count / Duplication Count / Critical Issues Count
```

## Step 7: Provide next actions

- If CRITICAL issues exist: recommend resolving before `/speckit/implement`
- If only LOW/MEDIUM: user may proceed; provide improvement suggestions
- Provide explicit command suggestions

## Step 8: Offer remediation

Ask the user: "Would you like me to suggest concrete remediation edits for the top N issues?" Do NOT apply them automatically.

## Next Steps

After completing this workflow, present these options to the user and wait for their choice:

1. **`/speckit/implement`** — Proceed to implementation if no CRITICAL issues found
2. **`/speckit/specify`** or **`/speckit/plan`** — Return to fix CRITICAL issues first
