# LaTeX Conventions

Encoding, file structure, and comment style follow [plain-text.md](plain-text.md). The rules below apply to `.tex` sources and TeX repository layout in addition.

## `.latexmkrc` Header

Every `.latexmkrc` starts with a plain-text YAML header ([plain-text.md](plain-text.md)). Mandatory `title` uses the project display name from `.mtdt.yaml` (`project.name`):

```perl
# ---
# title: Latexmkrc for Korrespondenzen
# ---

# ---
```

One root `.latexmkrc` per repository. Do not keep a second copy under `share/` / `shared/` or next to each `main.tex`, except a thin per-document override that only sets engine-specific keys (e.g. `$pdf_mode`) when documents in one repo need different engines. Overrides are passed as a second `-r` after the root rc.

## Build Output

- PDF and auxiliary files go under the **repository root** `build/` (not next to the `.tex` cwd).
- Use the dia-project-annex snippet `latexmkrc/out-dir/build.pl`. Root resolution (no `.git`):
  1. `WIRE_ROOT` or `TEX_ROOT` if set (direnv / install stubs / just — same idea as wire)
  2. else walk up from cwd for `.mtdt.yaml`
  3. else relative `build/` with a warning
- Prefer letting that snippet own `-outdir`/`-auxdir`; do not hard-code conflicting paths in justfiles or `tex-compile.sh`.
- **Exception (later):** notes trees may use `cache/build` instead of repo `build/`.

## Compilation Driver

Multi-document consumer repos ship `bin/tex-compile.sh` as a dia embed from dia-project-annex:

| Entry shape | Snippet |
|-------------|---------|
| `src/[<bucket>/]<slug>/main.tex` | `scripts/tex-compile/main.sh` |
| `src/[<bucket>/]*.tex` | `scripts/tex-compile/flat.sh` |
| `src/<bucket>/*/idx*.tex` | `scripts/tex-compile/idx.sh` |

Host file shape (shebang stays outside the marker):

```sh
#!/usr/bin/env sh

# dia:begin scripts/tex-compile/main.sh
…
# dia:end
```

Driver rules:

- Resolve the repo root from the script location (not via `git`, so tarballs work).
- From each source directory, invoke `latexmk -silent -r "${repo}/.latexmkrc" -jobname=…` (engine via the rc / optional second `-r` override; do not start latexmk in the repo root so the rc is not read twice).
- Do not pass `-outdir` / `-auxdir` (the root rc owns `build/`).
- Optional first argument selects a lifecycle bucket under `src/` (`running`, `archive`, …).
- Without an argument (`main.sh`): `src/running/*/main.tex` if present, else flat `src/*/main.tex`, else `src/archive/*/main.tex`.
- `jobname=<slug>` for slug dirs; `jobname=<stem>` for flat `*.tex`.

justfiles / Make should call `bin/tex-compile.sh` rather than re-encoding latexmk flags.

## Repository Roles

Two roles, two folder names — do not mix `examples/` and document source under one vocabulary. The name `instantiations/` is obsolete.

### Package examples (Fancter)

```text
pkg-*/
  .latexmkrc
  src/wire/…              # cls / sty
  examples/
    <slug>/main.tex       # one demo per directory
    shared/               # optional shared demo inputs
  build/
```

- Entry file is always `main.tex`.
- Compile with `latexmk -cd -r .latexmkrc -jobname=<slug> examples/<slug>/main.tex` so parallel demos do not collide in `build/main.*`.
- Dia stack: `base` + `out-dir/build` + `texinputs/examples-pkg` (+ engine). Optional `examples/shared/` is on TEXINPUTS via that snippet.

### Document / consumer source

```text
doc-*/
  .latexmkrc
  bin/tex-compile.sh      # multi-document collections (dia embed)
  src/                    # real documents (was instantiations/)
    main.tex              # or src/<slug>/main.tex
    running/ …            # optional lifecycle buckets
    archive/ …
  share/…                 # optional styles / bib / assets (not shared/)
  build/
```

- Document trees use `src/`, not `examples/` (demos belong only to packages).
- Styles live under `share/` (name `shared/` is obsolete for this role).
- Dia stack: `base` + `out-dir/build` + `texinputs/document-root` + engine (`lualatex` unless overridden).
- Thesis layout below is the single-document special case of this role.

## Document Repository Layout (theses)

```text
thesis-*/
  .latexmkrc
  src/main.tex              # entry (= default jobname)
  src/segments/
  share/styles/
  share/bib/
  build/
```

- `.latexmkrc` lives at the repo root for convention/discoverability. Compile with `latexmk -cd -r .latexmkrc src/main.tex` (after `-cd`, cwd is `src/`, so pass the root rc explicitly via `-r`).
- Dia stack: `base` + `out-dir/build` + `texinputs/document-root` (+ `bibinputs/share-bib` when needed) + engine.

## White Spaces

- No white spaces between a command and its mandatory or optional arguments.
- In a keyval pair, no surrounding white spaces, to ensure proper parsing for all packages (e.g. `dataframe` is sensitive to them). Brace the value instead.

## Dashes

- In prose, write a spaced en-dash as TeX ` -- ` (space, two hyphens, space), not as a Unicode en-dash ` – ` or em-dash ` — `.
- Example: `Questions -- Frequently Committed Errors`, not `Questions – Frequently Committed Errors`.
- When converting from Markdown/Pandoc, rewrite ` – ` / ` — ` (and leftover bare `–` / `—`) to ` -- `.

## Quotation Marks

- Do **not** use TeX double quotes (two backticks / two apostrophes) or raw Unicode curly quotes in prose.
- Mark quoted words and short phrases with `\quoting{…}` (from `my-text-macros`; same glyph family as `\colloquial` / `\overstating`).
- Example: write `\quoting{Himmelsrichtungen}`, not TeX-style ``Himmelsrichtungen''.
- When converting from Markdown (or cleaning Pandoc output), rewrite TeX ``…'', Unicode `“…”` / `„…“`, and mixed forms such as `„…''` into `\quoting{…}`.

## Math Delimiters

- Inline math: `$…$` only. Do **not** use `\(...\)`.
- Display math without a number/label: `\[…\]` (not `$$…$$`).
- Numbered or tagged displays: `equation`, `align`, and similar environments as needed.
- In `equation`, `align`, and similar environments with labelled or individually tagged lines, `\label` (and related commands) must precede `\tag`.
- In an `align` environment, a line break must follow `\\`; if there is only one left-hand side, separate it with a line break as well.
- When converting from Markdown/Pandoc: map `\(...\)` → `$…$`; keep or normalise display math as `\[…\]` (or a proper `equation`/`align` environment when labels/tags are required).

## Percentage Sign Handling

- Macros spanning several lines must end each line with `%` (this avoids most stray-space bugs).
- For readability (and to toggle blocks via comment), each keyval pair may occupy its own indented line, which must then end with `%`. After the last keyval pair, type a trailing comma.

## Labels

A label name starts with a type shortcut, then a colon, then the identifier:

- Structure: `part`, `ch`, `sec`, `subsec`
- Statements: `pass`, `def`, `lem`, `prop`, `thm`, `cor`, `fact`, `exa`

Append variants with `-` and numerals (`1`, `2`, …), conditions with `al`, `be`, …; equation labels depend on context.

## Commands Without Arguments

- If such a command is the only one on its line, escape it with `%`.
- Otherwise, escape it with `{}`.

## Compliance

Scan document TeX repos under `staged/`, `archive/`, and `permanent/` with:

```sh
bin/check-tex-repos.sh
```

The script skips package trees that have `examples/`. It fails on missing document-stack markers in `.latexmkrc`, multi-document layouts without a dia-marked `bin/tex-compile.sh`, justfiles that bypass `tex-compile` when the driver exists, and obsolete `shared/` directories.
