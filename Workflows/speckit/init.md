---
description: Bootstrap the speckit project structure. Run once per project before using any other /speckit.* workflow.
---

## Outline

1. **Check `.specify/memory/` directory**:
   - If it does not exist, create it.

2. **Check `.specify/memory/constitution.md`**:
   - If it does not exist, copy from `.specify/templates/constitution-template.md`.
   - Confirm the copy succeeded before proceeding.

3. **Check `specs/` directory**:
   - If it does not exist at the repo root, create it.

4. **Commit the initialized structure**:
   - Stage any newly created files.
   - Commit with message: `chore: initialize speckit project structure`
   - Skip commit if nothing was created (already initialized).

5. **Report what was created** (or confirm already initialized).

6. **Explain the branch naming convention**:

   All speckit workflows require a feature branch named with a 3-digit zero-padded number prefix:

   ```
   001-feature-name
   002-another-feature
   ```

   Create a feature branch before running `/speckit.specify`:
   ```bash
   git checkout -b 001-your-feature-name
   ```

## Next Steps

After completing this workflow, present these options to the user and wait for their choice:

1. **`/speckit.constitution`** — Define project principles and governance before writing any specs (recommended for new projects)
2. **`/speckit.specify <description>`** — Start your first feature specification directly
