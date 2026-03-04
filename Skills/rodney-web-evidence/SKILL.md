---
name: rodney-web-evidence
description: Use when Cline needs browser-based evidence for Web UI tasks, including assertions, screenshots, or accessibility checks, and must attach results to a Showboat demo.
---

# Rodney Web Evidence

## Overview

Use Rodney for web interaction evidence and Showboat as the source-of-truth delivery artifact.

**Core rule:** Web completion claims require browser assertions plus screenshot evidence.

## When to Use

Use this skill when tasks involve:
- web UI behavior validation
- browser clicks/forms/navigation checks
- screenshot evidence for delivery
- DOM/accessibility assertions

If the task has no web UI, skip Rodney and use Showboat-only evidence.

## Preconditions

1. A Showboat demo file already exists: `docs/demos/<task>-demo.md`.
2. Global tools are installed with `uv tool install showboat` and `uv tool install rodney`.
3. The target page URL and key selectors/assertions are known.

## Required Flow

1. Read tool capabilities.

```bash
uv tool install rodney
rodney --help
```

2. Start a browser session (headless by default).

```bash
rodney start
```

3. Open page and wait for readiness.

```bash
rodney open "<url>"
rodney waitload
rodney waitidle
```

4. Run verifiable checks.

```bash
rodney exists "<selector>"
rodney visible "<selector>"
rodney assert "document.title.includes('<keyword>')"
```

5. Capture screenshot and add it to the same Showboat demo.

```bash
IMG_FILE="docs/demos/<task>-web.png"
rodney screenshot "$IMG_FILE"
showboat image "docs/demos/<task>-demo.md" "$IMG_FILE"
```

6. Stop browser session.

```bash
rodney stop
```

## Showboat Integration Pattern

For each key Rodney command, write a short note and capture output via Showboat:

```bash
showboat note "$DEMO_FILE" "Web check: <purpose>"
showboat exec "$DEMO_FILE" bash "rodney <subcommand> ..."
```

## Failure Handling

- If any critical command fails (`start`, `open`, assertions, `screenshot`), stop delivery claims.
- Record failure evidence in Showboat and report next corrective action.
- Do not continue with a "success" summary after failed browser assertions.
