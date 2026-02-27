# cline-powerup

This repo is a small “power-up pack” to help a Cline agent work better by providing curated **Skills**, **Rules**, and **Workflows**.

## What’s inside

- `Skills/`: skill folders (each contains a `SKILL.md`)
- `Rules/`: agent rules / guardrails
- `Workflows/`: higher-level development workflows (e.g. Superpowers-style)

## Install

### 1) Put the whole repo under `~/Documents/`

From the folder *containing* this repo:

```sh
mv cline-powerup ~/Documents/Cline
```

If you prefer copying instead of moving:

```sh
cp -R cline-powerup ~/Documents/Cline
```

### 2) Move all skills into `~/.cline/skills/`

```sh
mkdir -p ~/.cline/skills
mv ~/Documents/Cline/Skills/* ~/.cline/skills/
```

## Verify

You should see skill folders under `~/.cline/skills/`, each containing a `SKILL.md`, for example:

```sh
find ~/.cline/skills -maxdepth 2 -name SKILL.md -print
```

## Notes

- Re-running the `mv` step will fail if a skill folder with the same name already exists in `~/.cline/skills/`. If you want to overwrite, remove or rename the destination folder(s) first.
- If you want to keep the repo as the “source of truth” and update skills later, consider using `cp -R` (copy) instead of `mv` (move).
