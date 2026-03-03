# Cline Superpowers Governance Design

## Goal

Define a strict, Cline-native governance system so every technical task follows the Superpowers process with controlled exceptions.

## Confirmed Decisions

- Scope: enforce workflow for all technical tasks, not just feature work.
- Fallback mode: guarded fallback (never silent skipping).
- Entry policy: default to `/deep-planning`; allow simplified entry only for small tasks with recorded fallback.
- Change scope: update `Rules/AGENTS.md` plus full Superpowers skill set under `Skills/`.
- Writing language: all updated files must be English.
- Model optimization target: instructions must be easier for smaller models (for example `gptoss-120b`, `qwen-coder-480B`) using explicit and low-ambiguity wording.

## Problem Statement

Current governance is partially defined and not fully aligned with Cline-native capabilities. Existing files still include mixed assumptions (for example non-Cline tool terms), which can cause execution drift:

- Rules say one thing while some skills imply another flow.
- Inconsistent terminology increases misinterpretation risk.
- Missing fallback contract allows undocumented shortcut behavior.

The desired state is a coherent system where Rules, Workflows, and Skills enforce the same process model.

## Architecture

### Layer 1: Governance Layer (`Rules/AGENTS.md`)

This file is the policy source of truth and defines:

- Mandatory Superpowers process for all technical tasks.
- Default planning entry using `/deep-planning`.
- Hard gates before implementation and completion claims.
- Guarded fallback contract and minimum safety floor.

### Layer 2: Workflow Layer (`Workflows/superpowers-dev.md`)

This file translates policy into executable Cline steps using a Cline-native sequence:

1. Intake and task classification.
2. Planning entry (default deep-planning, conditional simplification).
3. Plan finalization and execution preparation.
4. Controlled implementation with verification checkpoints.
5. Review and branch completion workflow.

Each step should use explicit `Input`, `Action`, `Output`, and `Stop Conditions` fields.

### Layer 3: Skill Layer (`Skills/*`)

All Superpowers skills are rewritten to use consistent Cline semantics:

- Replace non-Cline assumptions or references.
- Keep each skill focused on one workflow responsibility.
- Add a fallback behavior section where relevant.
- Standardize strict language and short action-oriented checklists.

## State Machine

Every technical task should follow this state model:

1. `INTAKE`
2. `PLAN_REQUIRED`
3. `IMPLEMENT`
4. `VERIFY`
5. `COMPLETE`

Transition rules:

- `INTAKE -> PLAN_REQUIRED` for every technical task.
- `PLAN_REQUIRED -> IMPLEMENT` only after approved plan output.
- `IMPLEMENT -> VERIFY` after changes are made.
- `VERIFY -> COMPLETE` only with explicit verification evidence.
- Any blocked precondition can trigger `GUARDED_FALLBACK` with mandatory record fields.

## Guarded Fallback Contract

Fallback is allowed only when a required precondition is unavailable. Each fallback record must include:

- `Trigger`: concrete blocking reason.
- `Risk`: what quality or safety is reduced.
- `Impact`: what could go wrong and where.
- `Compensation`: temporary controls used now.
- `Recovery`: how and when full flow is restored.

Non-negotiable floor:

- No implementation without planning intent.
- No completion claim without verification evidence.
- No silent fallback.

## Small-Task Simplification Policy

Default remains `/deep-planning`. Simplified entry is allowed only when all are true:

- Single-file or narrowly scoped change.
- Low architectural impact.
- Low regression risk.
- Clear acceptance criteria.

When simplified entry is used, create a guarded fallback record explaining why deep-planning was not used.

## Cline-Native Alignment Targets

The rewrite aligns with Cline customization and feature model:

- Rules are the policy layer.
- Skills are modular behavior units.
- Workflows are executable process templates.
- Optional future hardening can use Hooks for policy enforcement.
- Planning and execution flow should map to Plan/Act behaviors and optional Focus Chain tracking.

## Small-Model Instruction Design Rules

Apply these style constraints in updated files:

- Short sentences and one action per line.
- No implicit cross-paragraph dependencies.
- Use explicit inputs and expected outputs.
- Keep checklist blocks compact (typically 5-7 items).
- Add a short “Why” after strict MUST rules.
- Prefer concrete command/file examples over abstract guidance.

## File Scope

Planned rewrite scope:

- `Rules/AGENTS.md`
- `Workflows/superpowers-dev.md`
- Superpowers-relevant skills under `Skills/` (full set in this repository)

Supporting prompt templates under `Skills/subagent-driven-development/` may also be updated for terminology consistency.

## Validation Requirements

The implementation is complete only when all are true:

- All targeted files are in English.
- No remaining incompatible terms in active governance files (for example `TodoWrite`, `Task tool`, `Claude Code` assumptions where not intended).
- Governance, workflow, and skills reference one consistent lifecycle.
- Guarded fallback is explicitly defined and reused.
- Documentation remains internally consistent after rewrite.

## Risks and Mitigations

- Risk: over-strict rules reduce usability.
  - Mitigation: guarded fallback path with explicit accountability.
- Risk: broad text rewrite introduces contradictions.
  - Mitigation: perform terminology sweep and cross-file consistency checks.
- Risk: small models still miss long instructions.
  - Mitigation: use short deterministic wording and structured step blocks.

## Out of Scope

- Implementing custom Hooks in this pass.
- Building new non-superpowers skills.
- Refactoring unrelated content outside governance/process files.

## Success Criteria

A technical request should predictably trigger the same process behavior across Rules, Workflow, and Skills, with explicit fallback records when normal entry constraints are not met.
