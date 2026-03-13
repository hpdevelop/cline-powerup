---
description: Close development work with explicit integration options and a residual risk statement.
---

# /act/finish-branch — Complete Development Branch

**Pre-completion gates — all must be true before proceeding:**
- [ ] Planned scope is complete
- [ ] Verification evidence exists
- [ ] Blocker findings are resolved or explicitly deferred

## Step 1: Summarize changes

Describe what changed and why.

## Step 2: Summarize verification and review status

State the current state of tests, evidence, and review findings.

## Step 3: List residual risks

Document any known risks that remain after completion.

## Step 4: Present completion options

Present these options to the user and wait for their choice:
1. Merge now
2. Open PR
3. Keep branch for more work
4. Discard branch

## Step 5: Execute selected option

Carry out the chosen option safely.

## Guarded Fallback

If completion gates are partially blocked, record: Trigger, Risk, Impact, Compensation, Recovery.
Do not present the work as fully complete.
