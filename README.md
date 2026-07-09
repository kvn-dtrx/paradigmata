# Paradigmata

A reference collection of **repository layouts** (paradigms) for LLM agents to use when creating new repositories.

This repo contains **no production application code** — only minimal, illustrative examples with explanations of structure, conventions, and rationale.

## Purpose

When an agent creates a new repo, it should find and adopt suitable patterns here:

- Directory structure and naming conventions
- Typical configuration files (`.gitignore`, linter, CI, package manager)
- README and documentation layout
- Test and source code organization

## Usage for agents

1. Read `share/templates/README.md` — instructions for working with the available paradigms
2. Start with `share/templates/intersection/` — files every repo needs
3. Open the matching example under `share/templates/<name>/`
4. Use the example's file structure as a starting point for the new repo and adapt it to the specific use case

## Adding examples

Create new paradigms under `share/templates/<name>/`. Shared files belong in `intersection/` and are not repeated in individual templates.

Each example needs at least:

| File | Content |
|------|---------|
| `README.md` | Synopsis, directory tree, conventions |
| Minimal file structure | Illustrative, runnable, or stub files |

## Layout

```
paradigmata/
├── share/
│   └── templates/
│       ├── README.md       # Instructions for LLM agents
│       ├── intersection/   # What every repo needs
│       └── <paradigma>/    # Individual repository layout examples
└── README.md
```
