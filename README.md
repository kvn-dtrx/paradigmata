# Paradigmata

A reference collection of **repository layouts** (paradigms) and **writing
conventions** for LLM agents.

This repo contains **no production application code** — only minimal,
illustrative examples plus rules for how to write names, files, Make, commits,
and related artefacts.

## Purpose

When an agent creates or edits a repository, it should adopt patterns from here:

- Directory structure and naming
- Typical configuration files (`.gitignore`, linter, CI, package manager)
- README and documentation layout
- Test and source code organization
- Cross-cutting conventions (plain text, paths, Make targets, commits, …)

## Usage for agents

1. Read `share/templates/README.md` — how to pick and apply a repo paradigm
2. Read `share/conventions/README.md` — how to write files and names
3. Start with `share/templates/intersection/` — files every repo needs
4. Open the matching example under `share/templates/<name>/`
5. Apply conventions from `share/conventions/` while writing

## Adding examples

Create new paradigms under `share/templates/<name>/`. Shared template files
belong in `intersection/` and are not repeated in individual templates.

Cross-cutting rules belong under `share/conventions/`, not inside a single
paradigm.

Each template example needs at least:

| File | Content |
| --- | --- |
| `README.md` | Synopsis, directory tree, conventions |
| Minimal file structure | Illustrative, runnable, or stub files |

## Layout

```
paradigmata/
├── share/
│   ├── templates/
│   │   ├── README.md       # Instructions for LLM agents (layouts)
│   │   ├── intersection/   # What every repo needs
│   │   └── <paradigma>/    # Individual repository layout examples
│   └── conventions/
│       ├── README.md       # Instructions for LLM agents (writing rules)
│       └── *.md            # Topic conventions
└── README.md
```
