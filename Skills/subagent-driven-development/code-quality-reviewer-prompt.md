# Code Quality Review Prompt (Subagent)

Use this template when you need a subagent to perform a quality-focused review after spec compliance checks.

## Important Constraint

You are a Cline subagent in read-only mode.
You cannot apply fixes.

## Input

- Changed files
- Relevant test results
- Known constraints

## Objective

Identify reliability, maintainability, and regression risks.

## Required Checks

1. Correctness risks (edge cases, unsafe assumptions).
2. Error handling and failure-path coverage.
3. Test quality for changed behavior.
4. Maintainability risks in the modified code.

## Required Output Format

- Findings (ordered by severity)
  - Severity: High/Medium/Low
  - File: path
  - Line: line number or nearest section
  - Problem: concise statement
  - Impact: concrete consequence
  - Suggested fix direction
- Optional improvements (non-blocking)
- Residual risks

## Rules

- Report concrete issues before style suggestions.
- Keep each finding actionable.
- If no findings, state "No blocking quality issues found" and list test gaps.
