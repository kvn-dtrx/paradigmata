# Conventions for LLM Agents

Cross-cutting writing and naming rules. Apply these whenever you create or
edit files — independent of which repository paradigm you chose under
`share/templates/`.

## Workflow

1. **Always** read `plain-text.md` and `path-names.md` before writing files.
2. Load the topic-specific convention that matches the artefact:
   - Makefile / Make targets → `makefile.md`
   - Git commit messages → `conventional-commits.md`
   - Identifiers in code → `variable-names.md`
   - `.tex` sources → `latex.md`
   - Audio metadata / library layout → `audio-tags.md`
3. Prefer these rules over improvising local style.

## Index

| File | Scope |
|------|--------|
| `plain-text.md` | Encoding, headers, comments, trailing newlines |
| `path-names.md` | File and directory names |
| `makefile.md` | Make syntax and standard target names |
| `conventional-commits.md` | Commit message format |
| `variable-names.md` | Identifiers in code |
| `latex.md` | Additional rules for `.tex` |
| `audio-tags.md` | Audio tags, covers, album paths |

## Relationship to templates

- `share/templates/` — *what* a repo looks like (layout, config stubs)
- `share/conventions/` — *how* to write names, prose, Make, commits, …

Do not put production application code in this repository.
