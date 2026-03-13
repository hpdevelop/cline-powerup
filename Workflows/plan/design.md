---
description: Turn a request into an approved design and execution plan before any implementation begins.
---

# /plan/design — Design and Plan

**Hard gate:** Do not write implementation code, modify source files, or call any act workflow until the user has explicitly approved the design.

## Step 1: Explore context

Read relevant source files, docs, and recent git commits.
Understand the current structure before asking anything.

## Step 2: Ask clarifying questions

Ask one question at a time. Prefer multiple-choice options.
Focus on: purpose, constraints, and success criteria.
Stop asking when you have enough to propose approaches.

## Step 3: Propose approaches

Present 2–3 approaches with trade-offs.
Lead with your recommended option and explain why.
Wait for the user to choose before proceeding.

## Step 4: Present design

Walk through the design one section at a time:
- Architecture
- Components
- Data flow
- Error handling
- Testing strategy

Ask the user if each section looks right before moving to the next.
Revise any section the user pushes back on.

## Step 5: Write design document

Write the approved design to `docs/plans/YYYY-MM-DD-<topic>-design.md`.
Commit the document to git.

## Step 6: Write implementation plan

No implementation code in this step.

Break the approved design into small, concrete tasks. Each task must have:
- Files to create/modify/test
- Step-by-step actions
- Commands to run
- Expected output
- Commit suggestion

Every plan must include:
1. Goal
2. Architecture summary
3. Ordered task list
4. File-level changes
5. Test steps
6. Verification evidence expectations
7. Risk notes

Save the plan to `docs/plans/YYYY-MM-DD-<feature-name>.md`.

## Step 7: Offer execution choice

Ask the user:
1. Execute in this session — run `/act/execute-plan` now
2. Execute in a separate session — save and continue later

## Guarded Fallback

If a required step cannot complete, record: Trigger, Risk, Impact, Compensation, Recovery.
