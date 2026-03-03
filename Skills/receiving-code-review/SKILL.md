---
name: receiving-code-review
description: Use when review feedback arrives, to validate findings and apply fixes with technical rigor.
---

# Receiving Code Review

## Purpose

Process review feedback with evidence and technical rigor.

Why: not every comment is correct; each action should be justified.

## Required Input

- Review findings
- Relevant code and tests
- Plan requirements

## Required Output

- Accepted findings list
- Rejected findings with rationale
- Fix plan and verification results

## Workflow

1. Classify each finding by severity and confidence.
2. Validate each finding against code and requirements.
3. Accept, reject, or defer with reason.
4. Implement accepted fixes.
5. Re-verify changed behavior.

## Rules

- Do not accept feedback blindly.
- Do not reject feedback without evidence.
- Keep a traceable decision record.

## Guarded Fallback

If a finding cannot be validated now, record:
- Trigger
- Risk
- Impact
- Compensation
- Recovery

Mark unresolved findings explicitly.

## Small-Model Guidance

- Use one finding per block.
- Include direct code references.
- Keep rationale concise and testable.
