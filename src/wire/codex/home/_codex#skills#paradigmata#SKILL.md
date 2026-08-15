---
name: paradigmata
description: >-
  Apply or audit against the Paradigmata reference library (repo layouts under
  share/templates/, writing rules under share/conventions/). Use when creating
  or restructuring a repository, scaffolding files, choosing directory layout,
  naming paths/files, writing Makefiles or commits, or when the user mentions
  paradigmata, paradigms, conventions, templates, apply mode, or
  paradigmen-check / compliance against personal conventions.
---

# Paradigmata

This skill ships with the Paradigmata repository (agent reference library, not a
project to extend). Library root = git root of that clone (parent of `share/`).

On this machine the usual checkout is:

`~/data/projects/staged/paradigmata`

Resolve paths below relative to that root. After `make install`, Cursor loads
this skill from `~/.cursor/skills/paradigmata` (symlink into the clone).

## Modes

Infer from the user request, or ask once if unclear:

| Mode | When |
|------|------|
| **apply** | New repo, scaffolding, structural edits, "follow paradigms" |
| **check** | Review / finish pass, "did we follow conventions?", `/paradigmen-check` |

## Apply

Follow the library's own agent workflow (do not improvise past it):

1. Read `share/conventions/README.md`, then at least `plain-text.md` and `path-names.md`, plus any topic files you will touch (Make, commits, Python, shell, YAML, LaTeX, audio-tags, …).
2. Read `share/templates/README.md`. Choose **one** paradigm by purpose. `intersection/` is shared baseline, not a competing paradigm.
3. Read all files under `share/templates/intersection/`, then under `share/templates/<paradigma>/` (start with that paradigm's `README.md`).
4. Adopt that layout and config stubs as the basis; adapt only what the use case requires.
5. While writing, prefer `share/conventions/` over inventing local style.

Do not:

- Mix multiple paradigms in one repo
- Put production/business logic into Paradigmata itself
- Make large deviations without a short rationale in the **target** repo

## Check

1. Identify artefacts in scope (paths created/edited, or user-named scope).
2. Load `share/conventions/README.md` and every topic file that applies to those artefacts.
3. If layout/scaffolding is in scope, also compare against `intersection/` and the chosen paradigm under `share/templates/` (ask which paradigm if unknown).
4. Report findings as a short list:

```markdown
## Paradigmata check
- **Scope:** …
- **Paradigm:** … (or n/a)
- **Violations:** …
- **Uncertain:** …
- **OK:** …
```

5. Unless the user asked for report-only, fix clear violations in the target repo.

## Topic map (conventions)

| Artefact | File under `share/conventions/` |
|----------|----------------------------------|
| Headers, comments, encoding | `plain-text.md` |
| File/dir names | `path-names.md` |
| Make | `makefile.md` |
| Commits | `conventional-commits.md` |
| Identifiers | `variable-names.md` |
| Python sections | `python.md` |
| Config glosses | `config.md` |
| Shell / `wire.ini` | `shell.md` |
| YAML listings | `yaml.md` |
| LaTeX | `latex.md` |
| Public vs private history | `public-private-hygiene.md` |
| Audio library/tags | `audio-tags.md` |

## Examples

- User: "neues Python-Repo anlegen" → **apply** (conventions + matching template).
- User: "paradigmen-check" / "halten wir uns an die Conventions?" → **check**, then fix unless report-only.
- User: "Commit-Message formulieren" → read `conventional-commits.md` (lightweight apply).
