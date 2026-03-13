# cline-powerup

A portable powerup pack for [Cline](https://github.com/cline/cline) — reusable Skills, always-active Rules, and Workflows that plug into any project.

## What's included

| Directory | Purpose |
|---|---|
| `Skills/` | Contextual expertise loaded by Cline when relevant (TDD, debugging, code review, etc.) |
| `.clinerules/` | Always-active rules loaded for every task (TDD policy, SOLID, governance, constitution template) |
| `Workflows/` | Step-by-step processes invoked with `/workflow-name` |

### Workflows

| Path | Invocation | Purpose |
|---|---|---|
| `superpowers-dev.md` | `/superpowers-dev` | Entry point for every technical task — classify, plan, execute, review, complete |
| `plan/design.md` | `/plan/design` | Brainstorm and write an implementation plan |
| `plan/review.md` | `/plan/review` | Review implementation against plan and tests |
| `plan/enhance.md` | `/plan/enhance` | Read-only codebase analysis (TDD/SOLID/Clean Code) |
| `act/execute-plan.md` | `/act/execute-plan` | Execute an approved implementation plan |
| `act/tdd.md` | `/act/tdd` | RED → GREEN → REFACTOR cycle with evidence |
| `act/debug.md` | `/act/debug` | Systematic debugging from failure to root cause |
| `act/finish-branch.md` | `/act/finish-branch` | Summarise, verify, and close out a feature branch |
| `speckit/init.md` | `/speckit/init` | Bootstrap speckit project structure |
| `speckit/specify.md` | `/speckit/specify` | Create a feature spec from a natural language description |
| `speckit/clarify.md` | `/speckit/clarify` | Resolve ambiguities in the spec |
| `speckit/plan.md` | `/speckit/plan` | Generate implementation plan artifacts |
| `speckit/tasks.md` | `/speckit/tasks` | Generate a dependency-ordered task list |
| `speckit/analyze.md` | `/speckit/analyze` | Cross-artifact consistency analysis |
| `speckit/checklist.md` | `/speckit/checklist` | Generate requirements quality checklists |
| `speckit/implement.md` | `/speckit/implement` | Execute the implementation plan task by task |
| `speckit/constitution.md` | `/speckit/constitution` | Create or update the project constitution |
| `speckit/taskstoissues.md` | `/speckit/taskstoissues` | Convert tasks to GitHub issues |

## Setup

### Install into a project

```sh
git clone https://github.com/hpdevelop/cline-powerup.git
cd cline-powerup
./setup.sh /path/to/your/project
```

This copies:
- **Skills** → `~/.cline/skills/` (global — available in all projects)
- **Workflows** → `<project>/.clinerules/workflows/`
- **Rules** → `<project>/.clinerules/` (TDD, SOLID, governance, constitution template)

Preview what will be installed without writing anything:

```sh
./setup.sh /path/to/your/project --dry-run
```

Install skills globally only (no project target):

```sh
./setup.sh --global
```

### After setup

1. Open your project in VS Code with the Cline extension
2. Skills are available globally across all projects immediately
3. Invoke workflows in the Cline chat with `/workflow-name` (e.g. `/superpowers-dev`, `/act/tdd`)
4. Rules in `.clinerules/` are always-active for the project — no invocation needed

### Updating

Pull the latest and re-run `setup.sh` — existing files are backed up before overwriting:

```sh
git pull
./setup.sh /path/to/your/project
```

Backups are saved as `<filename>.bak.YYYYMMDDHHMMSS` in the same directory.

## Typical workflow

```
/superpowers-dev          ← start here for any technical task
  └── /plan/design        ← brainstorm and write a plan
  └── /act/execute-plan   ← implement the plan
  └── /plan/review        ← verify against plan and tests
  └── /act/finish-branch  ← commit, PR, or discard
```

For spec-driven features:

```
/speckit/init → /speckit/specify → /speckit/clarify → /speckit/plan
  → /speckit/tasks → /speckit/analyze → /speckit/implement
```
