# `src/` vs `share/`

`share` is not `shared`. Do not name this locus `shared/`.

Repo `share/` is not `~/.local/share`. Install destinations stay in `config/wire.ini` (or `kpsewhich`, pip, XDG data). See [tooling-locus.md](tooling-locus.md).

## Rule

Place each tree with one question:

**Are these files the body of this repo’s work or system, or a stock of items meant to be used independently?**

| Answer | Put it in |
| --- | --- |
| Body of this work or system (program, document, wiki, notes corpus, overlay) | `src/` |
| Independently usable stock (taken one-by-one, loaded as input, or the whole repo is that catalog) | `share/` |

If both kinds exist, split along that line. If the whole product is a catalog, the repo may be `share/` only.

When still unsure: **is the intended use “belongs in this work”, or “take / load this item on its own”?** First → `src/`. Second → `share/`.

## Decide

| | `src/` | `share/` |
| --- | --- | --- |
| Wiki page, note in a notes corpus | yes | |
| Program, TeX document, TeX package (`src/<pkg>/`) | yes | |
| Wire capsule (overlay system), `from = src/wire` | yes | |
| Snippet / template / convention catalog | | yes |
| Bib, document styles, letter `.lco`/`.cls` the letters load | | yes |
| Contacts, hosts, prompt fragments (record catalog) | | yes |
| Krypta vault blobs (stored, not the overlay) | | yes |
| Demo inputs next to package `examples/` | | `examples/share/` |

`config/` is this project’s settings. `bin/` is entry points. Do not git `state/` or `cache/`. Do not leave an empty `share/` placeholder.

## Anti-patterns

- `share/` because the file is markdown
- `src/` because we authored a snippet catalog
- `shared/` as a directory name
- `from = share` in `wire.ini`
- TeX package sources under `src/wire/`; documents under `examples/`
- Ops scripts under `src/wire/bin/` unless `mount.bin` publishes them

TeX trees: [latex.md](latex.md).
