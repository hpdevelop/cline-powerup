# Superpowers Development Workflow (Cline-Native)

Use this workflow for every technical task.
Default entry is `/deep-planning`.

## Phase 1: Intake and Classification

**Input**
- User request
- Active rules and relevant skills

**Action**
- Classify whether the request is technical.
- If technical, start governance lifecycle.

**Output**
- Task class (`technical` or `non-technical`)
- Initial scope notes

**Stop Conditions**
- If request is non-technical, exit this workflow.

## Phase 2: Planning Entry

**Input**
- Technical task from Phase 1

**Action**
- Use `/deep-planning` by default.
- Allow simplified entry only for small tasks that are:
  - single-file or tightly scoped
  - low architectural impact
  - low regression risk
  - clear acceptance criteria
- If simplified entry is used, record guarded fallback fields:
  - Trigger
  - Risk
  - Impact
  - Compensation
  - Recovery

**Output**
- Approved planning output
- Optional guarded fallback record

**Stop Conditions**
- No approved planning output -> do not implement.

## Phase 3: Plan Finalization

**Input**
- Planning output from Phase 2

**Action**
- Convert plan to explicit execution steps.
- Add test and verification checkpoints.
- Confirm dependencies and sequence.

**Output**
- Execution-ready plan with ordered steps

**Stop Conditions**
- Missing test or verification steps -> revise plan.

## Phase 4: Implementation and Verification Loop

**Input**
- Execution-ready plan

**Action**
- Execute steps in order.
- Keep changes minimal and scoped.
- Run required verification after each critical change.
- Record evidence (test output, command output, or equivalent checks).

**Output**
- Implemented changes
- Verification evidence log

**Stop Conditions**
- Failing verification -> fix before next step.
- Missing evidence -> cannot move to completion.

## Phase 5: Review and Branch Completion

**Input**
- Implemented and verified work

**Action**
- Perform code review against plan and risks.
- Summarize residual risks.
- Present branch completion options.

**Output**
- Final report with evidence and risks
- Merge/PR/hold/discard options

**Stop Conditions**
- Blocker findings unresolved -> do not complete.

## Non-Negotiable Rules

- No implementation before approved planning output.
- No completion claim without verification evidence.
- No silent fallback.
