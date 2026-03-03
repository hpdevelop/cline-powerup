# Cline Superpowers Governance Charter

## Scope

This charter applies to **all technical tasks**:
- coding
- debugging
- refactoring
- tests
- workflow/rule/skill updates
- technical analysis and review

If a request is technical, this process is mandatory.

## Default Entry

Use `/deep-planning` by default before implementation.

Why: strong planning reduces rework and lowers risk on multi-file or ambiguous tasks.

## Lifecycle State Model

Every technical task must follow this order:
1. `INTAKE`
2. `PLAN_REQUIRED`
3. `IMPLEMENT`
4. `VERIFY`
5. `COMPLETE`

Do not skip or reorder states.

## Hard Gates

- No implementation before an approved planning output.
  Why: implementation without approved intent causes hidden scope drift.
- No completion claim without verification evidence.
  Why: claims without evidence are unreliable.

## Small-Task Simplified Entry

You may skip `/deep-planning` only when all are true:
- single-file or tightly scoped change
- low architectural impact
- low regression risk
- clear acceptance criteria

If you simplify entry, you must record a guarded fallback entry.

## Guarded Fallback Contract

Fallback is allowed only when a required precondition is unavailable.
Every fallback entry must include:
- `Trigger`: exact blocker
- `Risk`: what quality or safety is reduced
- `Impact`: where failure may appear
- `Compensation`: temporary controls applied now
- `Recovery`: how and when full flow is restored

No silent fallback is allowed.

## Minimum Safety Floor

Even in fallback mode:
- keep a planning intent record
- keep verification evidence before completion
- list open risks in the final report

## Execution Expectations

- Use clear, short, deterministic instructions.
- Prefer one action per line.
- Explicitly state expected output for each critical step.
- Keep terminology consistent with Cline Rules, Skills, and Workflows.
