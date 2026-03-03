---
name: requesting-code-review
description: Use after implementation checkpoints to run a structured code review before final completion.
---

# Requesting Code Review

## Purpose

Run structured review before final completion.

Why: review catches regressions, mismatches, and missing tests early.

## Required Input

- Plan requirements
- Code changes
- Verification evidence

## Required Output

- Findings list ordered by severity
- Open questions and assumptions
- Required fixes before completion

## Workflow

1. Compare code against plan requirements.
2. Inspect behavior risks and regression risks.
3. Check test coverage for changed behavior.
4. Produce findings first, summary second.

## Finding Format

For each finding include:
- severity
- file path
- line reference
- impact
- suggested fix direction

## Guarded Fallback

If full review cannot run, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Do not mark completion without at least a minimal review record.

## Small-Model Guidance

- Use short factual finding statements.
- Avoid broad style-only comments as primary findings.
