---
description: Convert existing tasks into actionable, dependency-ordered GitHub issues for the feature based on available design artifacts.
tools: ['github/github-mcp-server/issue_write']
---

# /speckit/taskstoissues — Convert Tasks to GitHub Issues

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Step 1: Load prerequisites

Run `.specify/scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks` from repo root and parse FEATURE_DIR and AVAILABLE_DOCS list. All paths must be absolute.
For single quotes in args like "I'm Groot", use escape syntax: e.g `'I'\''m Groot'`.

Extract the path to **tasks.md** from the script output.

## Step 2: Verify GitHub remote

Run:
```bash
git config --get remote.origin.url
```

> [!CAUTION]
> ONLY PROCEED IF THE REMOTE IS A GITHUB URL.

## Step 3: Create GitHub issues

For each task in tasks.md, use the GitHub MCP server to create a new issue in the repository that matches the Git remote URL.

> [!CAUTION]
> UNDER NO CIRCUMSTANCES EVER CREATE ISSUES IN REPOSITORIES THAT DO NOT MATCH THE REMOTE URL.

## Next Steps

After completing this workflow, present this option to the user:

1. **`/speckit/implement`** — Begin implementation now that tasks are tracked as issues
