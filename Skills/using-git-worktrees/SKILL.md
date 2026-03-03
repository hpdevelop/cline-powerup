---
name: using-git-worktrees
description: Use before isolated feature execution when you need a clean workspace and branch separation.
---

# Using Git Worktrees

## Purpose

Create an isolated workspace before implementation work.

Why: isolation reduces accidental conflicts and keeps review boundaries clean.

## Required Input

- Base repository path
- Target branch name
- Task identifier

## Required Output

- New worktree path
- Branch mapping
- Baseline verification status

## Workflow

1. Confirm clean understanding of target branch strategy.
2. Create a branch with `codex/` prefix.
3. Create worktree directory.
4. Verify repository state in the new worktree.
5. Report path and next-step command context.

## Rules

- Do not reuse unrelated dirty worktrees.
- Keep one main task per worktree.
- Verify baseline tests/checks before large edits.

## Suggested Commands

```bash
git worktree add <path> -b codex/<task-name>
cd <path>
git status --short
git branch --show-current
```

## Guarded Fallback

If worktree creation is blocked, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

You may proceed in current workspace only with explicit fallback record.

## Small-Model Guidance

- Prefer command blocks over long prose.
- Report exact paths.
- Report branch names exactly.
