# Conventions for LLM Agents

Cross-cutting writing and naming rules. Apply these whenever you create or
edit files — independent of which repository paradigm you chose under
`share/templates/`.

## Workflow

1. **Always** read `plain-text.md`, `path-names.md`, and `src-vs-share.md` before writing files.
2. Load the topic-specific convention that matches the artefact:
   - Makefile / Make targets → `makefile.md`
   - Git commit messages → `conventional-commits.md`
   - Identifiers in code → `variable-names.md`
   - `.tex` sources → `latex.md`
   - User vs repo tool config → `tooling-locus.md`
   - PATH-wired product CLIs → `path-cli.md`
   - Public vs private commit placement → `public-private-hygiene.md`
   - Audio metadata / library layout → `audio-tags.md`
   - Top-level `src/` vs `share/` (work/system vs resource stock) → `src-vs-share.md`
   - Shell / ShellCheck → `shell.md`
   - Native Git hooks / TSV catalogs → `git-hooks.md`
3. Prefer these rules over improvising local style.

## Index

| File | Scope |
| --- | --- |
| `plain-text.md` | Encoding, headers, comments, trailing newlines |
| `path-names.md` | File and directory names |
| `src-vs-share.md` | When to use `src/` vs `share/` (work/system vs independently usable resources) |
| `makefile.md` | Make syntax and standard target names |
| `conventional-commits.md` | Commit message format |
| `variable-names.md` | Identifiers in code |
| `latex.md` | `.tex` style, repo layout, `.latexmkrc`, `tex-compile.sh` |
| `tooling-locus.md` | Where configs live (user / repo / XDG cache): latexindent, gitignore, … |
| `path-cli.md` | PATH umbrella command + subcommands for make-wire / mount.bin repos |
| `public-private-hygiene.md` | Where publishable vs semantically private material may live in git history |
| `audio-tags.md` | Audio tags, covers, album paths |
| `shell.md` | Shell bracing/quoting; ShellCheck dialect, disables, SC1007 |
| `git-hooks.md` | Native hooks, `core.hooksPath`, and Dotfiles policy through Repolicy |

## Relationship to templates

- `share/templates/` — *what* a repo looks like (layout, config stubs)
- `share/conventions/` — *how* to write names, prose, Make, commits, …

Do not put production application code in this repository.
