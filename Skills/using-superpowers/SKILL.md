---
name: using-superpowers
description: Use at the start of every technical task to enforce skill-first workflow selection and lifecycle gates.
---

# Using Superpowers

## Purpose

Use this skill first for every technical task.

Why: early workflow selection prevents random execution and inconsistent quality.

## Required Input

- User request
- Active project rules
- Available skills list

## Required Output

- Chosen skill set
- Execution order
- Lifecycle gate status (`INTAKE`, `PLAN_REQUIRED`, `IMPLEMENT`, `VERIFY`, `COMPLETE`)

## Workflow

1. Check whether the task is technical.
2. If technical, enforce lifecycle order.
3. Select process skills first.
4. Select implementation skills second.
5. Announce chosen skills in one short line.
6. Follow each selected skill exactly.

## Skill Selection Rules

- If a relevant skill exists, use it.
- If uncertain, load the skill and verify fit.
- Do not skip a clearly relevant process skill.

## Mandatory Order

1. `brainstorming` for design and approval.
2. `writing-plans` for implementation plan.
3. Execution skills (for example `executing-plans` or `subagent-driven-development`).
4. Verification and completion skills.

## Hard Gates

- No implementation before approved design and plan output.
- No completion claim without verification evidence.

## Guarded Fallback

If any precondition is unavailable, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Do not use silent fallback.

## Small-Model Guidance

- Keep sentences short.
- Keep one action per line.
- State expected outputs explicitly.
