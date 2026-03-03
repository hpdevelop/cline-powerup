---
name: writing-plans
description: Use after an approved design to produce a detailed, executable implementation plan before coding.
---

# Writing Plans

## Purpose

Create an execution-ready implementation plan from an approved design.

Why: detailed planning keeps implementation deterministic and verifiable.

## Required Input

- Approved design document
- Current repository structure
- Constraints and success criteria

## Required Output

- Plan file at `docs/plans/YYYY-MM-DD-<feature-name>.md`
- Ordered tasks with explicit verification steps
- Execution handoff choice

## Hard Gates

- Do not write implementation code in this skill.
- Do not skip testing and verification steps in the plan.

## Plan Structure

Every plan must include:
1. Goal
2. Architecture summary
3. Task list
4. File-level changes
5. Test steps
6. Verification evidence expectations
7. Risk notes

## Task Granularity Rule

Each task should be small and concrete (usually 2-5 minutes):
- one coding action
- one validation action
- one commit action when meaningful

## Task Template

Use this template for each task:

- Task name
- Files to create/modify/test
- Step-by-step actions
- Commands to run
- Expected output
- Commit suggestion

## Quality Rules

- Use exact file paths.
- Use explicit commands.
- State expected pass/fail outcomes.
- Keep scope minimal (DRY and YAGNI).

## Execution Handoff

After saving the plan, offer:
1. Same-session execution
2. Separate-session execution

For both options, require verification before completion claims.

## Guarded Fallback

If planning cannot follow the normal path, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

## Small-Model Guidance

- Prefer short imperative lines.
- Avoid long narrative blocks.
- Repeat critical gate conditions in plain words.
