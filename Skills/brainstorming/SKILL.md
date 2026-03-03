---
name: brainstorming
description: Use before implementation to turn a request into an approved design with clear constraints and trade-offs.
---

# Brainstorming

## Purpose

Create an approved design before any implementation action.

Why: design-first work reduces rework and avoids hidden assumptions.

## Hard Gate

Do not run implementation skills.
Do not write code.
Do not modify behavior.
Stop until the user approves the design.

## Required Input

- Current project context
- User goal
- Constraints and success criteria

## Required Output

- Approved design
- Design document in `docs/plans/YYYY-MM-DD-<topic>-design.md`
- Commit containing the design document
- Handoff to `writing-plans`

## Checklist

1. Explore context: files, docs, recent commits.
2. Ask one clarifying question at a time.
3. Propose 2-3 approaches with trade-offs.
4. Recommend one approach with reason.
5. Present design sections incrementally.
6. Get user approval for each section.
7. Write and commit the design document.
8. Transition to `writing-plans`.

## Design Sections

Use these sections:
- Architecture
- Components
- Data flow
- Error handling
- Testing strategy

## Question Rules

- Ask only one question per message.
- Prefer multiple-choice style when possible.
- Ask follow-up only when the current answer is insufficient.

## Guarded Fallback

If you cannot complete a required brainstorming step, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

## Small-Model Guidance

- Use short paragraphs.
- Use explicit section titles.
- Keep each list flat and deterministic.
