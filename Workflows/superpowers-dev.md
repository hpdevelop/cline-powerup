---
description: Entry point for every technical task. Classifies the request, gates on planning approval, runs implementation, verifies, and completes.
---

# /superpowers-dev — Development Lifecycle

**Non-negotiable rules:**
- No implementation before approved planning output.
- No completion claim without verification evidence.
- No silent fallback.

## Step 1: Classify the request

Determine whether the request is technical (coding, debugging, refactoring, analysis, workflow/rule updates) or non-technical.

If non-technical: respond directly and exit this workflow.
If technical: continue to Step 2.

## Step 2: Plan

For complex or multi-file tasks, run `/plan/design`.
For small, tightly scoped tasks (single file, low regression risk, clear acceptance criteria), you may skip to Step 3 — but record a guarded fallback entry: Trigger, Risk, Impact, Compensation, Recovery.

Do not proceed to Step 3 without an approved plan.

## Step 3: Execute

Run `/act/execute-plan` against the approved plan.

Execute steps in order. Run verification after each critical change. Record evidence. Stop and fix on failure — do not skip ahead.

## Step 4: Review

Run `/plan/review` against the completed implementation.

Do not proceed to Step 5 if blocker findings are unresolved.

## Step 5: Complete

Run `/act/finish-branch`.

Present merge/PR/hold/discard options with residual risk statement.
