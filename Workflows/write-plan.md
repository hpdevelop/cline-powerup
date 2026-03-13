# /write-plan — Create Execution Plan

## When to use

After an approved design exists. Do not write implementation code in this step.

## Hard Gates

- No implementation code.
- No skipping test and verification steps.

## Steps

1. Read the approved design document.
2. Break the design into small, concrete tasks (one coding action + one verification action each).
3. For each task, specify:
   - Files to create/modify/test
   - Step-by-step actions
   - Commands to run
   - Expected output
   - Commit suggestion
4. Add test steps and verification evidence expectations.
5. Save the plan to `docs/plans/YYYY-MM-DD-<feature-name>.md`.
6. Offer execution choice: same-session or separate-session.

## Plan Structure

Every plan must include:
1. Goal
2. Architecture summary
3. Ordered task list
4. File-level changes
5. Test steps
6. Verification evidence expectations
7. Risk notes

## Output

- Plan file at `docs/plans/YYYY-MM-DD-<feature-name>.md`

## Guarded Fallback

If planning cannot follow normal path, record: Trigger, Risk, Impact, Compensation, Recovery.
