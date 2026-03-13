# Cline Superpowers Governance Charter

## Scope

All technical tasks: coding, debugging, refactoring, tests, skill/workflow updates, analysis, review.

## Default Entry

Use `/deep-planning` before implementation.

## Lifecycle

Every technical task follows this order — do not skip or reorder:
1. INTAKE
2. PLAN_REQUIRED
3. IMPLEMENT
4. VERIFY
5. COMPLETE

## Hard Gates

- No implementation without approved planning output.
- No completion claim without verification evidence.

## Small-Task Exception

Skip `/deep-planning` only when ALL are true:
- Single-file or tightly scoped change
- Low architectural impact
- Low regression risk
- Clear acceptance criteria

If exception applies, record a guarded fallback entry.

## Guarded Fallback

When a required precondition is unavailable, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

No silent fallback.

## Minimum Safety Floor

Even in fallback:
- Keep a planning intent record.
- Keep verification evidence before completion.
- List open risks in the final report.
