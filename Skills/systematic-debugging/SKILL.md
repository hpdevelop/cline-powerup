---
name: systematic-debugging
description: Use when behavior is failing or unexpected to identify root cause before applying a fix.
---

# Systematic Debugging

## Purpose

Find the root cause before writing a fix.

Why: symptom-based fixes create regressions and unstable behavior.

## Required Input

- Reproducible failure signal
- Scope of impact
- Current hypotheses (if any)

## Required Output

- Confirmed root cause
- Minimal fix plan
- Verification evidence that the fix resolves the original failure

## Workflow

1. Capture the exact failure.
2. Reproduce consistently.
3. Isolate changed variables.
4. Trace data/control flow to root cause.
5. Propose minimal fix.
6. Verify with focused tests and regression checks.

## Rules

- Do not patch before root cause is confirmed.
- Prefer measurements over assumptions.
- Record disconfirmed hypotheses.

## Verification Evidence

Include:
- reproduction command or steps
- before/after behavior
- regression test or equivalent check

## Guarded Fallback

If full root-cause tracing is blocked, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Do not claim full fix confidence without root-cause evidence.

## Small-Model Guidance

- Use short hypothesis statements.
- Keep one hypothesis test per step.
- Mark each hypothesis as confirmed or rejected.
