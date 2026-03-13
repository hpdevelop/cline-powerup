# Project Constitution

## Core Principles

### I. Library-First Design
- New behavior MUST be implemented in reusable packages or modules before entry-point wiring (CLI, API, UI).
- Packages MUST expose deterministic APIs and include unit tests for success and failure paths.
- Public package behavior MUST be documented with comments that describe inputs, outputs, and failure modes.

Rationale: Isolating domain logic from entry-point wiring keeps features reusable, testable, and easier to review.

### II. Stable Public Interfaces
- User-facing workflows MUST be accessible through the project's defined entry points.
- Any interface contract change (flags, output schema, API shape, defaults) MUST include compatibility notes in release notes.
- Output formats MUST be consistent and documented when consumed by users or automation.

Rationale: Stable contracts protect automation, operators, and downstream consumers.

### III. Test-First Delivery (NON-NEGOTIABLE)
- Production behavior changes MUST start with failing tests before implementation code is added.
- Every feature or bug fix MUST include unit tests and update integration or e2e tests when interfaces or runtime behavior change.
- The full test suite MUST pass before merge; skipping or quarantining failing tests is prohibited.

Rationale: Red-green-refactor catches regressions early and keeps behavior changes intentional.

### IV. Integration Coverage for Contract Boundaries
- Integration tests MUST cover boundary contracts when those contracts change.
- Schema or protocol updates MUST include compatibility regression cases.
- Integration tests MUST run in pull request validation before merge.

Rationale: Boundary failures are high-risk and need contract-level evidence.

### V. Isolated End-to-End Verification
- e2e tests MUST run in an isolated environment (e.g. containers, mock services) that does not affect production systems.
- e2e scenarios MUST cover primary success paths, failure paths, and edge cases relevant to the feature.
- e2e runs MUST produce report artifacts for human and automated review.

Rationale: Isolated e2e prevents side effects and validates production-like flows.

### VI. Observability by Default
- Runtime logs MUST be structured and include enough context to diagnose failures without access to source code.
- Retry, throttling, and fatal-exit events MUST be visible in logs or stderr.
- Long-running operations MUST emit progress and completion summaries.

Rationale: Reliable diagnostics are required to debug production variance and failures.

### VII. Versioning and Release Evidence
- Releases MUST use semantic versioning `MAJOR.MINOR.PATCH`.
- Every release MUST include release notes covering features, fixes, breaking changes, and migration guidance.
- Breaking changes MUST increment `MAJOR` and document rollback or mitigation steps.

Rationale: Explicit version semantics and release evidence reduce upgrade risk for users.

### VIII. SOLID Structural Boundaries
- Code structure MUST comply with SOLID: each module, type, and function MUST have one clear responsibility and one primary reason to change.
- High-level workflows MUST depend on narrow abstractions; domain modules MUST NOT depend on entry-point glue, concrete I/O, or transport details.
- Interfaces MUST be minimal and purpose-specific; god structs, god interfaces, and cyclic dependencies are prohibited.
- Feature growth MUST prefer composition or new implementations over modifying stable contracts unless a breaking change is intentionally approved and documented.

Rationale: SOLID boundaries keep behavior modular, testable, and safe to extend without coupling unrelated concerns.

## Technology Stack Requirements
- Primary language and runtime MUST be documented in `techContext.md` or an equivalent project reference.
- New third-party dependencies SHOULD be minimal and MUST include justification in the PR.
- Code organization MUST keep reusable domain logic separate from entry-point composition, argument handling, and user-facing I/O.

## Quality Gates
- The full unit test suite MUST pass.
- Code coverage MUST meet the project-defined threshold (document in `techContext.md`).
- e2e tests MUST pass when a change affects primary pipelines or contract boundaries.
- Pull requests MUST include command output or CI links proving gate execution.
- Changes that add or reshape modules, interfaces, or adapters MUST document SOLID boundary decisions in the relevant spec, plan, or pull request.

## Governance
- This constitution supersedes conflicting local practices for this repository.
- Amendment procedure MUST follow all steps:
  1. Submit a PR that explains changed principles, migration impact, and synchronized templates.
  2. Obtain approval from at least one maintainer.
  3. Update constitution version and `Last Amended` date in this file.
- Constitution semantic versioning policy:
  - MAJOR: remove or redefine a principle in a backward-incompatible way.
  - MINOR: add a principle/section or materially expand mandatory guidance.
  - PATCH: wording clarifications with no policy behavior change.
- Compliance review expectations:
  - Every plan, spec, and task artifact MUST include a constitution alignment check.
  - Architecture reviews MUST confirm responsibility boundaries, interface ownership, and dependency direction for new or changed modules.
  - Reviewers MUST block merges when MUST-level rules are unmet unless a dated exception is recorded in the feature's tracking.
  - Template alignment MUST be reviewed on every constitution amendment.

**Version**: 1.0.0 | **Ratified**: TODO | **Last Amended**: TODO
