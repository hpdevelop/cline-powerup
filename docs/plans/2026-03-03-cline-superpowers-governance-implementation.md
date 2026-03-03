# Cline Superpowers Governance Implementation Plan

> **For Cline:** Execute this plan task-by-task in order. Do not skip verification gates.

**Goal:** Enforce a strict Cline-native Superpowers workflow for all technical tasks with a documented guarded fallback path.

**Architecture:** Use a three-layer governance model. `Rules/AGENTS.md` defines policy, `Workflows/superpowers-dev.md` defines executable process, and `Skills/*` defines operational behavior. Align terminology and decision flow across these layers for deterministic execution.

**Tech Stack:** Markdown governance files, Cline Rules/Skills/Workflows model, shell-based verification commands.

---

### Task 1: Create a verification baseline

**Files:**
- Create: `scripts/verify-governance-alignment.sh`
- Test: `scripts/verify-governance-alignment.sh`

**Step 1: Write a failing verification script**

Create a script that checks for disallowed terms in target governance files, such as:
- `TodoWrite`
- `Task tool`
- `In Claude Code`
- `For Claude:` (in active governance instructions)
- `EnterPlanMode` / `ExitPlanMode`

Include only target files:
- `Rules/AGENTS.md`
- `Workflows/superpowers-dev.md`
- `Skills/*/SKILL.md`
- `Skills/subagent-driven-development/*-prompt.md`

**Step 2: Run the script and confirm it fails before rewrites**

Run: `bash scripts/verify-governance-alignment.sh`
Expected: non-zero exit with at least one hit.

**Step 3: Commit baseline script**

```bash
git add scripts/verify-governance-alignment.sh
git commit -m "chore: add governance alignment verification script"
```

### Task 2: Rewrite AGENTS governance policy in English

**Files:**
- Modify: `Rules/AGENTS.md`
- Test: `Rules/AGENTS.md`

**Step 1: Replace current content with policy charter**

Required sections:
- Scope (`all technical tasks`)
- Default planning entry (`/deep-planning`)
- Hard gates (`no implementation before approved planning output`)
- Guarded fallback contract (`Trigger/Risk/Impact/Compensation/Recovery`)
- Completion gate (`no success claim without verification evidence`)

**Step 2: Run policy sanity check**

Run: `rg -n "deep-planning|guarded fallback|verification evidence" Rules/AGENTS.md`
Expected: all three concepts present.

**Step 3: Commit AGENTS rewrite**

```bash
git add Rules/AGENTS.md
git commit -m "docs: rewrite AGENTS governance for Cline-native superpowers flow"
```

### Task 3: Rewrite the Superpowers workflow as Cline-native execution steps

**Files:**
- Modify: `Workflows/superpowers-dev.md`
- Test: `Workflows/superpowers-dev.md`

**Step 1: Restructure workflow with deterministic blocks**

Each phase should use:
- Input
- Action
- Output
- Stop Conditions

Required phases:
1. Intake and task classification
2. Planning entry (`/deep-planning` default, simplification criteria)
3. Plan finalization
4. Implementation and verification checkpoints
5. Code review and branch completion

**Step 2: Validate workflow includes simplification policy**

Run: `rg -n "small task|simplified entry|guarded fallback" Workflows/superpowers-dev.md`
Expected: all terms found.

**Step 3: Commit workflow rewrite**

```bash
git add Workflows/superpowers-dev.md
git commit -m "docs: rewrite superpowers workflow with Cline-native guarded flow"
```

### Task 4: Rewrite core orchestration skills (entry and planning)

**Files:**
- Modify: `Skills/using-superpowers/SKILL.md`
- Modify: `Skills/brainstorming/SKILL.md`
- Modify: `Skills/writing-plans/SKILL.md`
- Test: above files

**Step 1: Replace non-Cline assumptions and terms**

Do all of the following:
- Remove `In Claude Code` sections.
- Replace non-Cline tool assumptions with Cline-compatible phrasing.
- Keep strict ordering: skill discovery -> brainstorming/design approval -> writing-plans.
- Keep one-question-at-a-time behavior in brainstorming.

**Step 2: Add small-model-friendly instruction style**

Add instruction conventions in each file:
- short sentences
- one action per line
- explicit expected output

**Step 3: Validate removal of incompatible terms in these files**

Run: `rg -n "TodoWrite|Task tool|In Claude Code|EnterPlanMode|ExitPlanMode" Skills/using-superpowers/SKILL.md Skills/brainstorming/SKILL.md Skills/writing-plans/SKILL.md`
Expected: no matches.

**Step 4: Commit core orchestration rewrites**

```bash
git add Skills/using-superpowers/SKILL.md Skills/brainstorming/SKILL.md Skills/writing-plans/SKILL.md
git commit -m "docs: align core superpowers orchestration skills with Cline"
```

### Task 5: Rewrite implementation discipline skills

**Files:**
- Modify: `Skills/test-driven-development/SKILL.md`
- Modify: `Skills/systematic-debugging/SKILL.md`
- Modify: `Skills/verification-before-completion/SKILL.md`
- Modify: `Skills/using-git-worktrees/SKILL.md`
- Test: above files

**Step 1: Normalize process vocabulary and gates**

Ensure each file uses consistent lifecycle language:
- planning prerequisite
- implementation checkpoint
- verification evidence requirement
- guarded fallback trigger behavior

**Step 2: Ensure each skill has explicit inputs and outputs**

Use short fixed sections per file:
- When to use
- Required input
- Required output
- Failure/fallback behavior

**Step 3: Run consistency grep**

Run: `rg -n "guarded fallback|verification evidence|required output" Skills/test-driven-development/SKILL.md Skills/systematic-debugging/SKILL.md Skills/verification-before-completion/SKILL.md Skills/using-git-worktrees/SKILL.md`
Expected: concepts present.

**Step 4: Commit discipline skill rewrites**

```bash
git add Skills/test-driven-development/SKILL.md Skills/systematic-debugging/SKILL.md Skills/verification-before-completion/SKILL.md Skills/using-git-worktrees/SKILL.md
git commit -m "docs: standardize discipline skills for Cline governance model"
```

### Task 6: Rewrite execution and review orchestration skills

**Files:**
- Modify: `Skills/subagent-driven-development/SKILL.md`
- Modify: `Skills/executing-plans/SKILL.md`
- Modify: `Skills/dispatching-parallel-agents/SKILL.md`
- Modify: `Skills/requesting-code-review/SKILL.md`
- Modify: `Skills/receiving-code-review/SKILL.md`
- Modify: `Skills/finishing-a-development-branch/SKILL.md`
- Test: above files

**Step 1: Align with Cline subagents semantics**

Apply these constraints:
- subagents are research-oriented in Cline docs; do not require unsupported behaviors.
- separate "research subagents" from "implementation loop" instructions.
- keep branch completion as a distinct final gate.

**Step 2: Remove incompatible process artifacts**

Remove references like `TodoWrite` and `Task tool` from these skills.

**Step 3: Validate keyword cleanup**

Run: `rg -n "TodoWrite|Task tool|For Claude|In Claude Code" Skills/subagent-driven-development/SKILL.md Skills/executing-plans/SKILL.md Skills/dispatching-parallel-agents/SKILL.md Skills/requesting-code-review/SKILL.md Skills/receiving-code-review/SKILL.md Skills/finishing-a-development-branch/SKILL.md`
Expected: no matches.

**Step 4: Commit execution/review skill rewrites**

```bash
git add Skills/subagent-driven-development/SKILL.md Skills/executing-plans/SKILL.md Skills/dispatching-parallel-agents/SKILL.md Skills/requesting-code-review/SKILL.md Skills/receiving-code-review/SKILL.md Skills/finishing-a-development-branch/SKILL.md
git commit -m "docs: rewrite execution and review skills for Cline-compatible flow"
```

### Task 7: Update subagent prompt templates to match Cline constraints

**Files:**
- Modify: `Skills/subagent-driven-development/implementer-prompt.md`
- Modify: `Skills/subagent-driven-development/spec-reviewer-prompt.md`
- Modify: `Skills/subagent-driven-development/code-quality-reviewer-prompt.md`
- Test: above files

**Step 1: Rewrite template instructions in Cline-compatible language**

Ensure templates:
- avoid unsupported tool assumptions.
- use explicit read-only vs editable responsibility.
- require concrete file references in findings.

**Step 2: Validate template terminology**

Run: `rg -n "Task tool|TodoWrite|Claude" Skills/subagent-driven-development/*-prompt.md`
Expected: no incompatible orchestration phrases.

**Step 3: Commit template rewrites**

```bash
git add Skills/subagent-driven-development/implementer-prompt.md Skills/subagent-driven-development/spec-reviewer-prompt.md Skills/subagent-driven-development/code-quality-reviewer-prompt.md
git commit -m "docs: update subagent prompt templates for Cline constraints"
```

### Task 8: Rewrite remaining superpowers skill instructions for terminology consistency

**Files:**
- Modify: `Skills/writing-skills/SKILL.md`
- Modify: `Skills/rodney-web-evidence/SKILL.md` (only if needed to keep consistency with new governance terms)
- Modify: `Skills/showboat-evidence-delivery/SKILL.md` (only if needed to keep consistency with new governance terms)
- Test: above files

**Step 1: Keep English-only, Cline-first language on active instruction surfaces**

For `writing-skills/SKILL.md`:
- replace platform-specific references that conflict with Cline governance.
- keep guidance deterministic and compact.

For `rodney`/`showboat`:
- only adjust terms that conflict with rewritten governance vocabulary.
- do not alter feature-specific behavior unless required.

**Step 2: Validate no direct contradiction with AGENTS policy**

Run: `rg -n "all technical tasks|guarded fallback|verification evidence" Rules/AGENTS.md Skills/writing-skills/SKILL.md`
Expected: no contradiction in wording.

**Step 3: Commit final skill consistency rewrites**

```bash
git add Skills/writing-skills/SKILL.md Skills/rodney-web-evidence/SKILL.md Skills/showboat-evidence-delivery/SKILL.md
git commit -m "docs: finalize superpowers terminology consistency for Cline"
```

### Task 9: Run full governance verification

**Files:**
- Test: all modified files in Rules/Workflows/Skills scope

**Step 1: Run custom verification script**

Run: `bash scripts/verify-governance-alignment.sh`
Expected: success (exit 0), no blocked term hits.

**Step 2: Run targeted grep checks for state model and fallback contract**

Run:
- `rg -n "INTAKE|PLAN_REQUIRED|IMPLEMENT|VERIFY|COMPLETE" Rules/AGENTS.md Workflows/superpowers-dev.md Skills/*/SKILL.md`
- `rg -n "Trigger|Risk|Impact|Compensation|Recovery" Rules/AGENTS.md Workflows/superpowers-dev.md Skills/*/SKILL.md`

Expected: required concepts found in governance-critical files.

**Step 3: Manual coherence review**

Review for contradictions between:
- `Rules/AGENTS.md`
- `Workflows/superpowers-dev.md`
- entry skills (`using-superpowers`, `brainstorming`, `writing-plans`)

**Step 4: Commit verification pass**

```bash
git add -A
git commit -m "chore: verify and finalize Cline superpowers governance alignment"
```

### Task 10: Final delivery and branch completion protocol

**Files:**
- None required (process task)

**Step 1: Summarize changes with exact file list and policy impacts**

Include:
- enforced flow behavior
- guarded fallback behavior
- Cline-native terminology conversion
- small-model instruction simplification pattern

**Step 2: Run branch completion workflow**

Use the branch completion skill instructions to present merge options with risks.

**Step 3: Record residual risks**

At minimum:
- areas not covered by automated checks
- tradeoffs from strict governance
- recommended follow-up (optional hooks hardening)

