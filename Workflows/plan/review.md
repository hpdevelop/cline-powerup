---
description: Review implementation against plan requirements before final completion.
---

# /plan/review — Code Review

## Step 1: Compare against plan

Compare code changes against the approved plan requirements.
Check for behavior risks and regression risks.

## Step 2: Check test coverage

Verify test coverage for all changed behavior.
Flag any changed code that lacks corresponding tests.

## Step 3: Produce findings

List all findings ordered by severity.

For each finding include:
- Severity (blocker / major / minor)
- File path and line reference
- Impact
- Suggested fix direction

## Step 4: Summarize

List open questions and assumptions.
List required fixes before completion.

## Guarded Fallback

If full review cannot run, record: Trigger, Risk, Impact, Compensation, Recovery.
Do not mark completion without at least a minimal review record.

## Reference

See `Skills/requesting-code-review/code-reviewer.md` for review criteria and checklist.
