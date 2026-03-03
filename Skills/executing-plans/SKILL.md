---
name: executing-plans
description: Use when an approved implementation plan exists and you need deterministic step-by-step execution.
---

# Executing Plans

## Purpose

Execute an approved plan in strict step order.

Why: deterministic execution prevents skipped gates and scope drift.

## Required Input

- Approved plan file
- Current repository state
- Verification commands

## Required Output

- Completed step log
- Verification evidence per step
- Final completion report

## Workflow

1. Read the full plan.
2. Execute one task at a time.
3. Run required verification after each task.
4. Record evidence before moving forward.
5. Stop and fix when verification fails.

## Rules

- No out-of-order execution unless plan is revised.
- No silent task merging.
- Keep commits scoped to current task.

## Review Integration

After each major step:
- run spec-alignment check
- run quality check
- update risk notes

## Guarded Fallback

If a planned step cannot run as written, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Then continue with explicit revised steps.

## Small-Model Guidance

- Keep one command block per step.
- Always state expected output.
- Use clear pass/fail language.
