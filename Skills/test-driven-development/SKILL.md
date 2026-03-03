---
name: test-driven-development
description: Use for any feature or bugfix implementation to enforce RED-GREEN-REFACTOR with explicit evidence.
---

# Test-Driven Development

## Purpose

Implement changes with RED-GREEN-REFACTOR.

Why: test-first execution provides proof that behavior changed as intended.

## Required Input

- Approved plan step
- Target behavior
- Test location

## Required Output

- Failing test (RED)
- Minimal passing implementation (GREEN)
- Safe cleanup/refactor (REFACTOR)
- Test evidence logs

## Workflow

1. Write one failing test for one behavior.
2. Run the test and confirm failure.
3. Write the minimal code to pass that test.
4. Re-run tests and confirm pass.
5. Refactor only with tests still passing.

## Rules

- One behavior per cycle.
- No production code before RED is observed.
- Keep implementations minimal.
- Re-run relevant tests after each change.

## Verification Evidence

Record at least:
- command used
- failing output summary
- passing output summary

## Guarded Fallback

If strict TDD cannot be applied, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Even in fallback, add a regression test before completion.

## Small-Model Guidance

- Keep cycle steps explicit.
- Keep each step short.
- Never combine RED and GREEN in one step.
