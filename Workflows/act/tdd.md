---
description: Implement any feature or bugfix using the RED → GREEN → REFACTOR cycle with explicit evidence.
---

# /act/tdd — Test-Driven Development

**Rules:**
- One behavior per cycle.
- No production code before RED is observed.
- Keep implementations minimal.
- Re-run relevant tests after each change.

## Step 1: RED — Write a failing test

Write one failing test for one behavior.
Run it. Confirm it fails for the right reason.

## Step 2: GREEN — Make it pass

Write the minimal code to pass that test.
Run tests. Confirm the test passes.

## Step 3: REFACTOR — Clean up

Improve the code without changing behavior.
Re-run tests after every change to confirm they still pass.

## Step 4: Record evidence

For each cycle record:
- Command used
- Failing output (RED)
- Passing output (GREEN)

Repeat Steps 1–4 for the next behavior.

## Guarded Fallback

If strict TDD cannot be applied, record: Trigger, Risk, Impact, Compensation, Recovery.
Add a regression test before completion even in fallback.

## Reference

See `Skills/test-driven-development/testing-anti-patterns.md` for patterns to avoid.
