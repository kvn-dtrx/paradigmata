# Config Conventions

Applies wherever a setting is declared — dedicated config files *and*
configuration blocks or constants embedded in code (scripts, modules, …).

General comment placement follows [plain-text.md](plain-text.md): the gloss
sits directly above the setting it describes, with no blank line between them.
Extra remarks use the usual markers (`NOTE:`, …) on following comment lines,
still above the setting.

Reference style: Firefox / Thunderbird `user.js` in the dotfiles repository.

## Gloss by value kind

| Kind | Gloss pattern | Example |
|------|----------------|---------|
| Boolean | `Whether to …` | `Whether to enable HTTPS-Only mode for all connections` |
| Enumeration / coded integer | `How to …; possible values:` then one line per value | see below |
| Quantity | `Number of …` / similar noun phrase | `Number of rows to show in the highlights section` |

Boolean glosses name the *enabled* meaning of the option; the concrete
`true`/`false` assignment carries the choice. When both poles need wording in
the gloss itself, state them in parentheses after the alternatives:

```text
# Whether Ctrl+Tab cycles through tabs in recently used order (true) or
# in left-to-right order (false)
```

These glosses are labels, not full prose sentences: no trailing period.

### Enumeration example

```text
# How to open links that request a new window; possible values:
# 1 = Opens in current window/tab
# 2 = Opens in a new window
# 3 = Opens in a new tab
setting = 3
```

### Boolean example

```text
# Whether to ask by default for download location
# NOTE: "Drive-by" downloads could place malicious files in the downloads folder
setting = false
```

## Sections

Group related keys under short banner comments, e.g. `# --- Browser ---`
(or `// --- Browser ---` where the host language uses `//`).

## Shell-like assignments (`wire.ini` and similar)

Files that use `key = value` with `${VAR}` expansion (especially
`config/wire.ini`) follow [shell.md](shell.md): always brace named parameters
(`${VAR}`, never `$VAR`); prefer `key = "${val}"` when expansion can introduce
whitespace; use single quotes to suppress expansion; omit quotes only for
safe plain tokens (`mode = symlink`, `from = src/wire`).
