---
description: Find the root cause of a failure before writing any fix.
---

# /act/debug — Systematic Debugging

**Hard gate:** Do not patch before root cause is confirmed.

**Rules:**
- Prefer measurements over assumptions.
- Record disconfirmed hypotheses.
- Do not claim full fix confidence without root-cause evidence.

## Step 1: Capture the failure

Record the exact failure: error message, stack trace, or test output.

## Step 2: Reproduce consistently

Confirm you can reproduce the failure on demand.
If not reproducible, investigate why it is intermittent before proceeding.

## Step 3: Isolate changed variables

Narrow down what changed. Compare working vs broken state.

## Step 4: Trace to root cause

Follow the data or control flow from symptom to source.
Record each hypothesis tested and whether it was confirmed or rejected.

## Step 5: Propose a minimal fix

Describe the smallest change that addresses the root cause.

## Step 6: Verify the fix

Apply the fix. Confirm the original failure is resolved.
Run a regression check to confirm no new failures were introduced.

Record:
- Reproduction command or steps
- Before/after behavior
- Regression test or equivalent check

## Guarded Fallback

If full root-cause tracing is blocked, record: Trigger, Risk, Impact, Compensation, Recovery.

## Reference

See `Skills/systematic-debugging/` for tracing patterns, root-cause examples, and defense-in-depth guides.
