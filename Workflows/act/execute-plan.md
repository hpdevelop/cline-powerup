---
description: Execute an approved implementation plan step by step with verification at each task.
---

# /act/execute-plan — Run Approved Plan

**Rules:**
- No out-of-order execution unless the plan is explicitly revised.
- No silent task merging.
- Keep commits scoped to the current task.
- No completion claim without verification evidence.

## Step 1: Read the full plan

Load the approved plan file. Understand all tasks, their order, and dependencies before starting.

## Step 2: Execute one task at a time

Work through tasks in plan order. Do not skip or merge tasks silently.

## Step 3: Verify after each task

Run required verification after completing each task.
Record evidence before moving to the next task.
Stop and fix when verification fails — do not continue.

## Step 4: Review after each major step

- Run spec-alignment check.
- Run quality check.
- Update risk notes.

## Step 5: Report completion

Produce a final completion report with:
- Completed step log
- Verification evidence per step

## Guarded Fallback

If a planned step cannot run as written, record: Trigger, Risk, Impact, Compensation, Recovery. Then continue with explicit revised steps.
