# Tooling Locus (User vs Repository)

Where a tool’s configuration lives matters as much as what it says. Prefer one
locus; do not keep full duplicates in every repo.

## Principle

| Locus | Put here when… |
| --- | --- |
| **User** (`~/.config/…`, XDG) | Personal taste; same preference across all solo repos; not part of a shared build contract |
| **Repository** | Collaborators / CI must share the rule; the file is the project’s interface |
| **XDG cache** (`~/.cache/…`) | Regenerable cruft (latexindent backups/logs, build junk diverted from the tree) |

Do not mirror a full user config into `config/` “just in case”. If a repo needs
a genuine delta, keep a **thin** repo file (or drop the repo file and fold the
delta into the user config when the style is global).

## latexindent

**Current practice:** settings live **user-wide** only:

- Active: `$LATEXINDENT_CONFIG` → `~/.config/latexindent/indentconfig.yaml` → `default.yaml`
- Source of truth in dotfiles: `dotfiles` wire `latexindent/config/`
- Scaffold template (dia): `dia-project-annex/src/latexindent/base.yaml` (keep in sync with the user default)

Notes collections (mint-notes, humanities-notes) do **not** ship a
`config/latexindent.yaml`. `sanitise-latex` falls back to the user config when
no project file is found.

**Backups:** latexindent always creates a backup under `-w` / `-wd`. There is
no “disable backups” switch. Practice:

- Prefer `onlyOneBackUp: 1` with `maxNumberOfBackUps: 0`. Setting
  `maxNumberOfBackUps` to a positive value **together with** `onlyOneBackUp: 1`
  makes latexindent force `onlyOneBackUp=0` and write `.bak0`.
- Divert backups and `indent.log` with `-c` (cruft directory). `sanitise-latex`
  uses `~/.cache/latexindent` for that. Do not leave `.bak*` next to sources;
  git is enough.

**When a repo file would be warranted:** a real style delta that must not apply
elsewhere (then a thin YAML with only that delta — not a full copy of
`default.yaml`).

## `.latexmkrc`

**Repository root** `.latexmkrc`, always. Compose from dia-project-annex
`latexmkrc/*` markers plus a YAML header and `# ---` body separator (see
[latex.md](latex.md)). Do not keep `config/latexmkrc`. Justfiles and compile
drivers should not restate `-outdir`/`-auxdir` when an out-dir snippet already
owns them.
## `.gitignore`

**Current practice:** compose the repo `.gitignore` from **dia embeds**
(`dia-project-annex` snippets such as `gitignore/base.ignore`,
`gitignore/latex.ignore`), not from ad-hoc full files copied between projects.

- Repo: tracked, dia-marked composition — binding for everyone who clones
- User: optional global excludes (`git config core.excludesFile`) for machine-
  local noise that must never enter any repo (editor debris, OS junk you always
  want ignored)

Do **not** put personal machine paths or one-off experiments only you care
about into the project `.gitignore` when a global excludes file would do.
Conversely, do **not** rely on user excludes for patterns collaborators need
(e.g. LaTeX aux, `build/`).

Paradigmata ships a stub under `share/templates/intersection/.gitignore` as a
layout placeholder; real content comes from dia when a project is instantiated.

## Related tools (same rule of thumb)

| Tool | Usual locus |
| --- | --- |
| `.latexmkrc` | **Repository root** only (not `config/`); dia-composed — see [latex.md](latex.md) |
| `justfile` / `Makefile` | **Repository** |
| `latexindent` | **User** (for now; see above) |
| Editor / LSP formatters | **User** unless the team standardises via repo config |
| `sanitise-latex` cruft (`-c`) | **XDG cache**, not the repo |
| Build PDFs / aux | Repo `build/` (gitignored) |

When unsure: if deleting the file would break a fresh clone’s build or CI, it
belongs in the repository; if it only encodes how you personally tidy sources,
keep it user-wide.
