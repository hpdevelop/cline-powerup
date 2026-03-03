---
name: dispatching-parallel-agents
description: Use when you have two or more independent research tasks that can run in parallel.
---

# Dispatching Parallel Agents

## Purpose

Run independent research tasks in parallel.

Why: parallel discovery is faster and preserves main-session context.

## Required Input

- List of independent research questions
- Shared scope boundaries
- Expected output format

## Required Output

- One result per parallel branch
- Consolidated summary with next actions

## Fit Criteria

Use this skill only if tasks are independent.
Do not use when tasks share mutable state or must run sequentially.

## Workflow

1. Split work into independent research tracks.
2. Write one focused prompt per track.
3. Run tracks in parallel.
4. Collect and normalize outputs.
5. Resolve contradictions before implementation decisions.

## Output Format

Each track should return:
- key finding
- evidence (file path, command output, or doc link)
- confidence
- recommended next action

## Guarded Fallback

If parallel execution is not possible, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Then run the same tracks sequentially.

## Small-Model Guidance

- Keep prompts short and concrete.
- Avoid multi-goal prompts.
- Require path-based evidence in each result.
