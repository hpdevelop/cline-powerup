# /execute-plan — Run Approved Plan

## When to use

When an approved implementation plan exists.

## Steps

1. Read the full plan.
2. Execute one task at a time in plan order.
3. Run required verification after each task.
4. Record evidence before moving to the next task.
5. Stop and fix when verification fails.

## Rules

- No out-of-order execution unless the plan is explicitly revised.
- No silent task merging.
- Keep commits scoped to the current task.
- No completion claim without verification evidence.

## Review After Each Major Step

- Run spec-alignment check.
- Run quality check.
- Update risk notes.

## Output

- Completed step log
- Verification evidence per step
- Final completion report

## Guarded Fallback

If a planned step cannot run as written, record: Trigger, Risk, Impact, Compensation, Recovery. Then continue with explicit revised steps.
