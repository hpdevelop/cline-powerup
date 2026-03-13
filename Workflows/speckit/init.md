---
description: Bootstrap the speckit project structure. Run once per project before using any other /speckit/* workflow.
---

# /speckit/init — Initialize Speckit

## Step 1: Check .specify/memory/

If `.specify/memory/` does not exist, create it.

## Step 2: Initialize constitution

If `.specify/memory/constitution.md` does not exist, copy from `.specify/templates/constitution-template.md`.
Confirm the copy succeeded before proceeding.

## Step 3: Check specs/

If `specs/` does not exist at the repo root, create it.

## Step 4: Commit

Stage any newly created files.
Commit with message: `chore: initialize speckit project structure`
Skip commit if nothing was created (already initialized).

## Step 5: Report and explain branch naming

Report what was created (or confirm already initialized).

All speckit workflows require a feature branch with a 3-digit zero-padded number prefix:

```
001-feature-name
002-another-feature
```

Create a feature branch before running `/speckit/specify`:
```bash
git checkout -b 001-your-feature-name
```

## Next Steps

After completing this workflow, present these options to the user and wait for their choice:

1. **`/speckit/constitution`** — Define project principles and governance before writing any specs (recommended for new projects)
2. **`/speckit/specify <description>`** — Start your first feature specification directly
