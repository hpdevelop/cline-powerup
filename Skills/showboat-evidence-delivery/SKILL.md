---
name: showboat-evidence-delivery
description: Use when Cline must deliver verifiable proof of completed work using real command outputs and demo artifacts in docs/demos/*.md.
---

# Showboat Evidence Delivery

## Overview

Use Showboat to produce a replayable evidence document from real command output.

**Core rule:** deliverables are trusted only when they come from `showboat exec` output, not hand-written markdown.

## When to Use

Use this skill when the user asks for:
- demo/proof/evidence artifacts
- verifiable delivery from actual execution
- command-output based validation
- repeatable handoff docs for QA/review

Do not use this skill for pure ideation tasks with no runnable output.

## Required Output

- Demo file path must be `docs/demos/<task>-demo.md`.
- Related screenshots should be stored under `docs/demos/`.

## Non-Negotiable Rules

1. Ensure Showboat is installed globally with `uv tool install showboat` (one-time per environment).
2. Run `showboat --help` at least once per task before building the demo.
3. Create the demo with `showboat init`; do not create it manually.
4. Record each validation step with `showboat note` + `showboat exec`.
5. If a step is wrong, use `showboat pop` and re-run; never hand-edit command/output blocks.
6. Finish with both `showboat verify` and `showboat extract`.
7. Do not depend on Claude/Codex-only tool names; use Cline command execution.

## Standard Procedure

1. Prepare folder and filename.

```bash
mkdir -p docs/demos
TASK_SLUG="<kebab-case-task>"
DEMO_FILE="docs/demos/${TASK_SLUG}-demo.md"
```

2. Install and check tool.

```bash
uv tool install showboat
showboat --help
```

3. Initialize demo.

```bash
showboat init "$DEMO_FILE" "${TASK_SLUG} evidence demo"
```

4. For each verification command, add note and execute.

```bash
showboat note "$DEMO_FILE" "Run: <what this command proves>"
showboat exec "$DEMO_FILE" bash "<command>"
```

5. If the latest entry is invalid, pop then redo.

```bash
showboat pop "$DEMO_FILE"
```

6. Final integrity checks.

```bash
showboat verify "$DEMO_FILE"
showboat extract "$DEMO_FILE"
```

## Failure Handling

- If any critical verification command fails, stop completion claims.
- Keep evidence truthful: either re-run after fixes or report failure explicitly.
- Never patch demo output manually to look successful.
