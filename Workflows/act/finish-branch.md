# /act/finish-branch — Complete Development Branch

## When to use

When implementation and verification are complete.

## Pre-Completion Gates

All must be true before proceeding:
- [ ] Planned scope is complete
- [ ] Verification evidence exists
- [ ] Blocker findings are resolved or explicitly deferred

## Steps

1. Summarize what changed.
2. Summarize verification and review status.
3. List residual risks.
4. Present completion options:
   1. Merge now
   2. Open PR
   3. Keep branch for more work
   4. Discard branch
5. Execute selected option safely.

## Output

- Branch completion report
- Residual risk statement
- Executed next step

## Guarded Fallback

If completion gates are partially blocked, record: Trigger, Risk, Impact, Compensation, Recovery.
Do not present the work as fully complete.
