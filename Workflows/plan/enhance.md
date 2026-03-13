---
description: Scan the entire codebase and generate a prioritized enhancement report based on TDD, SOLID, and Clean Code principles. Read-only — no code changes.
---

## User Input

```text
$ARGUMENTS
```

## Outline

### Step 1: Discover source files

Find all source files in the repository root. Exclude:
- `node_modules/`, `.git/`, `dist/`, `build/`, `out/`, `coverage/`
- Vendored dependencies and lock files
- Binary files and generated files

Collect the file list and note the total count before proceeding.

### Step 2: Analyse each file — single pass, three lenses

For each source file, apply all three lenses in one read:

**TDD lens** — flag:
- Functions or modules with no corresponding test file
- Logic that cannot be unit-tested (hidden dependencies, static calls, global state)
- Tests that are not isolated (share state, depend on execution order)
- Tests that assert nothing meaningful (empty assertions, always-pass conditions)
- Missing edge-case or negative-path tests for non-trivial logic

**SOLID lens** — flag:
- **SRP**: Classes or modules responsible for more than one concern
- **OCP**: Code that must be modified (not extended) to add new behaviour
- **LSP**: Subtypes that break the contract of their parent type
- **ISP**: Interfaces or base classes forcing consumers to implement unused methods
- **DIP**: High-level modules importing concrete low-level implementations directly

**Clean Code lens** — flag:
- Misleading, abbreviated, or generic names (`data`, `tmp`, `doStuff`, `flag`)
- Functions longer than 20 lines or with more than 3 parameters
- Magic numbers and unexplained literals
- Deep nesting (more than 3 levels)
- Dead code (unreachable branches, unused variables, commented-out blocks)
- Comments that explain *what* instead of *why* (the code should explain what)
- Duplicate logic that could be extracted into a named abstraction

For each finding record:
- `principle`: TDD | SOLID | Clean Code
- `severity`: high | medium | low
- `file`: relative path from repo root
- `line`: line number or range (best effort)
- `issue`: one-sentence description
- `suggestion`: one-sentence fix direction

### Step 3: Write the report

Create directory `docs/enhancements/` if it does not exist.

Write report to `docs/enhancements/YYYY-MM-DD-report.md` using today's date.

---

**Report structure:**

```
# Enhancement Report — YYYY-MM-DD

## Summary

| Principle  | High | Medium | Low | Total |
|------------|------|--------|-----|-------|
| TDD        |      |        |     |       |
| SOLID      |      |        |     |       |
| Clean Code |      |        |     |       |
| **Total**  |      |        |     |       |

Files scanned: N

## Findings

### TDD

#### High severity
- **`path/to/file.ts:42`** — <issue> → <suggestion>

#### Medium severity
...

#### Low severity
...

### SOLID

#### High severity
...

### Clean Code

#### High severity
...
```

Sort findings within each severity group by file path (alphabetical).

### Step 4: Report completion

Print:
```
Enhancement report written to docs/enhancements/YYYY-MM-DD-report.md
<N> findings: <H> high, <M> medium, <L> low
```
