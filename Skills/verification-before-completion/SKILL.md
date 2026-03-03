---
name: verification-before-completion
description: Use before claiming any task is complete, fixed, or passing to require evidence-based verification.
---

# Verification Before Completion

## Purpose

Require evidence before completion claims.

Why: evidence prevents false-positive completion reports.

## Required Input

- Implemented changes
- Declared acceptance criteria
- Relevant test/validation commands

## Required Output

- Verification report
- Pass/fail status per criterion
- Residual risk list

## Workflow

1. List acceptance criteria.
2. Run mapped verification commands.
3. Capture key outputs.
4. Mark each criterion pass or fail.
5. Report residual risks and gaps.

## Rules

- No "done" statement without evidence.
- If verification is partial, state it explicitly.
- Include exact commands used.

## Minimum Evidence Set

- command list
- result summary
- unresolved items (if any)

## Guarded Fallback

If full verification is impossible, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Completion must be reported as limited confidence in fallback mode.

## Small-Model Guidance

- Use a fixed checklist format.
- Keep outputs short and factual.
- Avoid ambiguous wording like "looks good".
