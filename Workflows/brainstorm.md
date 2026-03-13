---
description: Turn a request into an approved design before any implementation begins.
---

# /brainstorm — Design Before Implementation

**Hard gate:** Do not write code, modify files, or call any implementation workflow until the user has explicitly approved the design.

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

## Step 6: Hand off to planning

Run `/write-plan`.

## Guarded Fallback

If a required step cannot complete, record: Trigger, Risk, Impact, Compensation, Recovery.
