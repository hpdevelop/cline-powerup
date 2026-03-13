# /review — Code Review

## When to use

After implementation checkpoints, before final completion.

## Steps

1. Compare code against plan requirements.
2. Inspect for behavior risks and regression risks.
3. Check test coverage for changed behavior.
4. Produce findings list ordered by severity.
5. Summarize open questions and assumptions.
6. List required fixes before completion.

## Finding Format

For each finding:
- Severity (blocker / major / minor)
- File path and line reference
- Impact
- Suggested fix direction

## Output

- Findings list (severity-ordered)
- Required fixes before completion

## Guarded Fallback

If full review cannot run, record: Trigger, Risk, Impact, Compensation, Recovery.
Do not mark completion without at least a minimal review record.

## Reference

See `Skills/requesting-code-review/code-reviewer.md` for review criteria and checklist.
