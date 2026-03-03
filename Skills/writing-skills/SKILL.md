---
name: writing-skills
description: Use when creating or updating skills so instructions are Cline-native, testable, and easy for smaller models to follow.
---

# Writing Skills

## Purpose

Create or update skills with deterministic structure and clear trigger conditions.

Why: skills are execution controls. Ambiguous skill text causes workflow drift.

## Required Input

- Target skill path
- Intended trigger condition
- Expected behavior and constraints

## Required Output

- Updated `SKILL.md`
- Optional supporting files (`docs/`, `templates/`, `scripts/`)
- Verification notes for activation and correctness

## Workflow

1. Define the skill boundary.
2. Write a trigger-focused description.
3. Write short deterministic instructions.
4. Add explicit input/output sections.
5. Add guardrails and fallback behavior.
6. Verify terminology and consistency.

## Authoring Rules

- Keep `name` equal to directory name.
- Keep description focused on **when to use**.
- Keep body focused on **how to execute**.
- Use short steps and explicit expected outputs.
- Avoid platform-specific assumptions unless required.

## Structure Template

Use this section order:
1. Purpose
2. Required Input
3. Required Output
4. Workflow
5. Rules and Gates
6. Guarded Fallback
7. Small-Model Guidance

## Small-Model Optimization Rules

- One action per line.
- Use short imperative sentences.
- Avoid long narrative paragraphs.
- Repeat critical gates in plain language.
- Prefer examples with exact file paths and commands.

## Validation Checklist

- Skill is fully in English.
- No incompatible terms from other toolchains.
- Trigger condition is clear and testable.
- Hard gates are explicit where needed.
- Guarded fallback fields are present when failure paths exist.

## Guarded Fallback

If full authoring or validation cannot run, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

## Integration with Governance

When a skill controls technical execution, align wording with:
- all technical tasks lifecycle
- verification evidence requirement
- no silent fallback rule

## Minimal Example

```markdown
---
name: example-skill
description: Use when you need to validate API schema changes before merge.
---

# Example Skill

## Purpose
Validate API schema changes with repeatable checks.

## Required Input
- schema file path
- expected API change

## Required Output
- pass/fail validation summary
- list of breaking changes
```
