---
description: Generate a custom checklist for the current feature — unit tests for requirements quality, not implementation testing.
---

# /speckit/checklist — Requirements Quality Checklist

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

**Core concept:** Checklists are **unit tests for requirements writing** — they validate quality, clarity, and completeness of requirements. They do NOT test whether code works.

- ❌ NOT "Verify the button clicks correctly"
- ✅ YES "Are visual hierarchy requirements defined with measurable criteria?"

## Step 1: Load prerequisites

Run `.specify/scripts/bash/check-prerequisites.sh --json` from repo root and parse JSON for FEATURE_DIR and AVAILABLE_DOCS list. All file paths must be absolute.

## Step 2: Ask clarifying questions

Derive up to THREE contextual clarifying questions generated from the user's phrasing and signals in spec/plan/tasks. Only ask about information that materially changes checklist content. Skip any question already answered in `$ARGUMENTS`.

Question archetypes:
- Scope refinement, Risk prioritization, Depth calibration, Audience framing, Boundary exclusion, Scenario class gap

Format options as a compact table: Option | Candidate | Why It Matters (max A–E). After answers, ask up to TWO more follow-ups (Q4/Q5) only if ≥2 scenario classes remain unclear. Do not exceed five total questions.

## Step 3: Understand user request

Combine `$ARGUMENTS` + clarifying answers to derive:
- Checklist theme (e.g., security, review, deploy, ux)
- Must-have items explicitly mentioned
- Focus areas mapped to category scaffolding

## Step 4: Load feature context

Read from FEATURE_DIR (load only portions relevant to active focus areas):
- **Required**: spec.md — feature requirements and scope
- **If exists**: plan.md — technical details, dependencies
- **If exists**: tasks.md — implementation tasks

## Step 5: Generate checklist

Create `FEATURE_DIR/checklists/` directory if it does not exist.
Use a short, descriptive filename based on domain (e.g., `ux.md`, `api.md`, `security.md`).
If the file exists, append to it. Each run creates or appends — never overwrites.

Number items sequentially starting from CHK001.

**Every item MUST test requirements quality — not implementation behavior:**

| Quality Dimension | Example item |
|---|---|
| Completeness | "Are error handling requirements defined for all API failure modes? [Gap]" |
| Clarity | "Is 'fast loading' quantified with specific timing thresholds? [Clarity, Spec §NFR-2]" |
| Consistency | "Do navigation requirements align across all pages? [Consistency, Spec §FR-10]" |
| Measurability | "Can 'balanced visual weight' be objectively verified? [Measurability, Spec §FR-2]" |
| Coverage | "Are requirements defined for zero-state scenarios? [Coverage, Edge Case]" |

**Prohibited patterns** (these test implementation, not requirements):
- ❌ "Verify…", "Test…", "Confirm…" + implementation behavior
- ❌ References to code execution, clicks, renders, loads
- ❌ "Works correctly", "functions as expected"

**Required patterns:**
- ✅ "Are [requirement type] defined/specified for [scenario]?"
- ✅ "Is [vague term] quantified with specific criteria?"
- ✅ "Can [requirement] be objectively measured?"

Minimum traceability: ≥80% of items must include a spec section reference `[Spec §X.Y]` or a marker: `[Gap]`, `[Ambiguity]`, `[Conflict]`, `[Assumption]`.

Soft cap: if raw candidates exceed 40 items, prioritize by risk/impact and merge near-duplicates.

Follow the canonical template in `.specify/templates/checklist-template.md` for title, meta section, and ID formatting.

## Step 6: Report completion

Output:
- Full path to created/updated checklist
- Item count
- Focus areas selected, depth level, audience
- Reminder that each run creates a new file or appends to an existing one

## Next Steps

After completing this workflow, present this option to the user:

1. **`/speckit/implement`** — Proceed to implementation once checklists are reviewed and complete
