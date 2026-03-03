---
name: finishing-a-development-branch
description: Use when implementation and verification are complete and you need a safe branch completion decision.
---

# Finishing a Development Branch

## Purpose

Close development work with explicit integration options.

Why: explicit branch decisions prevent accidental merges and unclear handoff.

## Required Input

- Completed change set
- Verification evidence
- Review status

## Required Output

- Branch completion report
- Clear next-step options
- Residual risk statement

## Pre-Completion Gates

Confirm all are true:
- planned scope is complete
- verification evidence exists
- blocker findings are resolved or explicitly deferred

## Completion Options

Present options in order:
1. Merge now
2. Open PR
3. Keep branch for more work
4. Discard branch

For each option, include risks and expected follow-up actions.

## Workflow

1. Summarize what changed.
2. Summarize verification and review status.
3. List residual risks.
4. Present completion options.
5. Execute selected option safely.

## Guarded Fallback

If completion gates are partially blocked, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Do not present the work as fully complete.

## Small-Model Guidance

- Keep option descriptions short.
- Use explicit yes/no gate checks.
- Keep risk statements concrete.
