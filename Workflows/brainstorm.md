# /brainstorm — Design Before Implementation

## When to use

Before any implementation. Do not write code until the design is approved.

## Hard Gate

Stop. Do not implement. Do not modify files.
Wait for explicit user approval of the design.

## Steps

1. Explore context: read relevant files, docs, recent commits.
2. Ask one clarifying question at a time (multiple-choice preferred).
3. Propose 2–3 approaches with trade-offs. Recommend one.
4. Present design incrementally: architecture → components → data flow → error handling → testing strategy.
5. Get user approval for each section before proceeding.
6. Write the approved design to `docs/plans/YYYY-MM-DD-<topic>-design.md`.
7. Commit the design document.
8. Run `/write-plan`.

## Output

- Approved design document committed to `docs/plans/`
- Handoff to `/write-plan`

## Guarded Fallback

If a required step cannot complete, record: Trigger, Risk, Impact, Compensation, Recovery.
