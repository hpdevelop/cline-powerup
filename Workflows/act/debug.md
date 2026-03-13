# /act/debug — Systematic Debugging

## When to use

When behavior is failing or unexpected. Find root cause before writing any fix.

## Hard Gate

Do not patch before root cause is confirmed.

## Steps

1. Capture the exact failure (error message, stack trace, test output).
2. Reproduce consistently.
3. Isolate changed variables.
4. Trace data/control flow to the root cause.
5. Propose a minimal fix.
6. Verify the fix resolves the original failure without regressions.

## Rules

- Prefer measurements over assumptions.
- Record disconfirmed hypotheses.
- Do not claim full fix confidence without root-cause evidence.

## Evidence Required

- Reproduction command or steps
- Before/after behavior
- Regression test or equivalent check

## Guarded Fallback

If full root-cause tracing is blocked, record: Trigger, Risk, Impact, Compensation, Recovery.

## Reference

See `Skills/systematic-debugging/` for tracing patterns, root-cause examples, and defense-in-depth guides.
