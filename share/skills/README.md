---
title: Skills for Cursor agents
---

# Skills

Cursor Agent skills that operationalise this library. Source of truth lives here
under `share/skills/`; `make install` publishes them into `~/.cursor/skills/`
via wire (`src/wire/cursor/home/_cursor#skills#…`).

| Skill | Role |
|-------|------|
| `paradigmata/` | Apply or check layouts (`share/templates/`) and writing rules (`share/conventions/`) |

Do not edit copies under `~/.cursor/skills/` — change files here, then
re-`make install` if the symlink was replaced.
