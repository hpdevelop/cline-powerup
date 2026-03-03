---
name: subagent-driven-development
description: Use when executing a plan and you need parallel read-only research support from subagents.
---

# Subagent-Driven Development

## Purpose

Use subagents for parallel research while main implementation stays controlled.

Why: Cline subagents are read-only research agents. They are strong for discovery, not for direct code edits.

## Required Input

- Approved implementation plan
- Current task step
- Research questions that can run independently

## Required Output

- Consolidated research findings
- Main-session implementation decisions
- Verification evidence for each implemented step

## Cline Constraint

Subagents are read-only and cannot perform file edits.
Main implementation changes must be done in the primary session.

## Workflow

1. Select one implementation step from the plan.
2. Define focused research questions for subagents (optional).
3. Run subagents for parallel discovery.
4. Synthesize findings into concrete edit decisions.
5. Implement changes in the main session.
6. Verify before marking the step complete.

## When to Use Subagents

Use subagents only when research is broad:
- cross-module tracing
- architecture mapping
- dependency discovery

Skip subagents for small, obvious file changes.

## Review Gates Per Step

- Spec compliance check
- Code quality check
- Verification evidence check

## Guarded Fallback

If subagents are unavailable or unnecessary, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Then continue with main-session research.

## Small-Model Guidance

- Keep subagent prompts narrow.
- Ask one research question per prompt.
- Require file-path-based answers.
