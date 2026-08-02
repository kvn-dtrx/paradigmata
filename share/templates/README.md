# Instructions for LLM Agents

This repository is a **reference library for repository layouts and writing
conventions**. It is not a project you extend — it provides patterns you apply
when creating or editing repositories.

## Workflow: building a new repo

1. **Load conventions** — read `share/conventions/README.md`, then at least
   `plain-text.md` and `path-names.md` (plus topic files you will need)
2. **Choose a paradigm** — pick a repo by purpose; note that `intersection`
   holds what every repo needs and is not repeated in the other templates
3. **Load context** — read all files under `share/templates/<paradigma>/`
   fully, starting with `intersection/`
4. **Adopt the structure** — use the directory tree and conventions of the
   chosen example as your basis
5. **Adapt** — change only what the specific use case requires; keep
   established patterns

## What you take from a paradigm

- Directory layout (`src/`, `tests/`, `docs/`, …)
- Configuration files and their minimal contents
- Naming conventions (files, modules, branches)
- README structure and documentation level
- CI/CD scaffolding, if present

## What you take from conventions

- How to format plain-text headers and comments
- How to name files and directories
- Standard Make targets and Make/Just split
- Commit message shape
- Identifier naming in code
- Domain rules (LaTeX, audio tags, …)

## What you do not do

- Commit production code to this repo
- Fill examples with project-specific business logic
- Mix paradigms — one repo follows one clear pattern
- Make large deviations without documented rationale in the new repo
- Invent local style when a file under `share/conventions/` already covers it

## Adding a new paradigm

When a recurring repo pattern is missing:

1. Create `share/templates/<short-name>/`
2. Fill in `README.md` and a minimal illustrative file structure
3. Put shared files in `intersection/` instead of duplicating them

Keep examples **small and focused** — one paradigm per use case.

## Adding a convention

When a writing rule applies across paradigms:

1. Add or update a file under `share/conventions/`
2. Link it from `share/conventions/README.md`
3. Do not bury the same rule only inside a single template README
