# .clinerules Conflict Resolution Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Remove `memory-bank.md` from `.clinerules/` and trim `01-tdd.md` to a pure policy statement with a fallback pointer.

**Architecture:** Two targeted file operations — one deletion and one edit. No new files. No workflow changes.

**Tech Stack:** Bash, git.

---

## Chunk 1: Apply changes and commit

### Task 1: Delete `.clinerules/memory-bank.md`

**Files:**
- Delete: `.clinerules/memory-bank.md`

- [ ] **Step 1: Confirm the file exists**

```bash
ls .clinerules/
```

Expected output includes `memory-bank.md`.

- [ ] **Step 2: Delete the file via git**

```bash
git rm .clinerules/memory-bank.md
```

Expected: `rm '.clinerules/memory-bank.md'`

---

### Task 2: Edit `.clinerules/01-tdd.md`

**Files:**
- Modify: `.clinerules/01-tdd.md`

- [ ] **Step 1: Verify current content**

```bash
cat .clinerules/01-tdd.md
```

Expected — current file contains these 7 lines after the heading:
```
Write a failing test before writing any production code.
Follow RED → GREEN → REFACTOR strictly. One behavior per cycle.
No production code before a failing test is observed.
Re-run all relevant tests after each change.
Record test evidence: command run, failing output (RED), passing output (GREEN).
Add a regression test before any completion claim.
```

- [ ] **Step 2: Write the updated file**

Write exactly this content to `.clinerules/01-tdd.md`:

```markdown
# Test-Driven Development

Write a failing test before writing any production code.
Follow RED → GREEN → REFACTOR strictly. One behavior per cycle.
No production code before a failing test is observed.
Re-run all relevant tests after each change.
Add a regression test before any completion claim.
When TDD cannot be applied, follow the Guarded Fallback in 03-agents.md.
```

- [ ] **Step 3: Verify the diff**

```bash
git diff .clinerules/01-tdd.md
```

Expected diff:
```
-Record test evidence: command run, failing output (RED), passing output (GREEN).
 Add a regression test before any completion claim.
+When TDD cannot be applied, follow the Guarded Fallback in 03-agents.md.
```

Exactly one line removed, exactly one line added. No other changes.

---

### Task 3: Commit and push

- [ ] **Step 1: Stage the edit**

```bash
git add .clinerules/01-tdd.md
```

- [ ] **Step 2: Verify staged changes**

```bash
git status
```

Expected:
```
deleted:    .clinerules/memory-bank.md
modified:   .clinerules/01-tdd.md
```

- [ ] **Step 3: Commit**

```bash
git commit -m "fix: resolve .clinerules conflicts — remove memory-bank, trim 01-tdd

- Delete memory-bank.md: eliminates competing start-of-task mandate
- 01-tdd.md: remove evidence-recording detail (belongs in workflow)
- 01-tdd.md: add Guarded Fallback pointer to 03-agents.md"
```

- [ ] **Step 4: Push**

```bash
git push origin main
```

Expected: push succeeds, branch is up to date.
