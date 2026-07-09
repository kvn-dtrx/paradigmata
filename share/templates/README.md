# Instructions for LLM Agents

This repository is a **reference library for repository layouts**. It is not a project you extend — it provides patterns you apply when creating new repositories.

## Workflow: building a new repo

1. **Choose a paradigm** — pick a repo by purpose; note that `intersection` holds what every repo needs and is not repeated in the other templates
2. **Load context** — read all files under `share/templates/<paradigma>/` fully, starting with `intersection/`
3. **Adopt the structure** — use the directory tree and conventions of the chosen example as your basis
4. **Adapt** — change only what the specific use case requires; keep established patterns

## What you take from a paradigm

- Directory layout (`src/`, `tests/`, `docs/`, …)
- Configuration files and their minimal contents
- Naming conventions (files, modules, branches)
- README structure and documentation level
- CI/CD scaffolding, if present

## What you do not do

- Commit production code to this repo
- Fill examples with project-specific business logic
- Mix paradigms — one repo follows one clear pattern
- Make large deviations without documented rationale in the new repo

## Adding a new paradigm

When a recurring repo pattern is missing:

1. Create `share/templates/<short-name>/`
2. Fill in `README.md` and a minimal illustrative file structure
3. Put shared files in `intersection/` instead of duplicating them

Keep examples **small and focused** — one paradigm per use case.
