# Cline Superpowers Governance Charter

## Scope

All technical tasks: coding, debugging, refactoring, tests, skill/workflow updates, analysis, review.

## Default Entry

Run `/superpowers-dev` at the start of every technical task.
It gates on planning approval, executes, reviews, and closes the branch.

## Lifecycle

Every technical task follows this order — do not skip or reorder:

1. CLASSIFY — determine whether the request is technical
2. PLAN — run `/plan/design`; get approval before proceeding
3. IMPLEMENT — run `/act/execute-plan` against the approved plan
4. REVIEW — run `/plan/review`; resolve blockers before proceeding
5. COMPLETE — run `/act/finish-branch`

## Hard Gates

- No implementation without approved planning output (`/plan/design`).
- No completion claim without verification evidence (`/plan/review`).

## Small-Task Exception

Skip `/plan/design` only when ALL are true:
- Single-file or tightly scoped change
- Low architectural impact
- Low regression risk
- Clear acceptance criteria

If exception applies, record a guarded fallback entry before implementing.

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
