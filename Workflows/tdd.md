# /tdd — Test-Driven Development Cycle

## When to use

For any feature or bugfix implementation.

## Cycle: RED → GREEN → REFACTOR

1. **RED**: Write one failing test for one behavior. Run it. Confirm failure.
2. **GREEN**: Write the minimal code to pass that test. Run tests. Confirm pass.
3. **REFACTOR**: Clean up with tests still passing.

## Rules

- One behavior per cycle.
- No production code before RED is observed.
- Keep implementations minimal.
- Re-run relevant tests after each change.

## Evidence Required

Record for each cycle:
- Command used
- Failing output (RED)
- Passing output (GREEN)

## Guarded Fallback

If strict TDD cannot be applied, record: Trigger, Risk, Impact, Compensation, Recovery.
Add a regression test before completion even in fallback.

## Reference

See `Skills/test-driven-development/testing-anti-patterns.md` for patterns to avoid.
