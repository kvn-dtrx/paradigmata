# Plain Text Conventions

## General Rules

- The preferred encoding is UTF-8.
- Whenever possible, whitespaces shall be preferred over tabs.
- Multiple whitespaces are only allowed for indentation and padding.
- There is no reason for trailing white spaces, even in Markdown files.[^markdown-trailing-spaces]
- The last line shall be blank, i.e. a plain text file shall end with a trailing newline character. Most Unix utilities expect text files to be terminated this way; without it, e.g. `cat` may glue the last line to the shell prompt.
- We logically dissect the file into a header and a body as follows:

    ```plain text
    {{{Header}}}

    {{{Comment character(s)}}} ---

    {{{Body}}}
    ```

[^markdown-trailing-spaces]: In Markdown files, two trailing white spaces are used to create a line break, i.e. they have the same effect as `<br>`.

## Markdown Prose

- Do **not** hard-wrap Markdown prose at a column width. A paragraph is one logical line (editors may soft-wrap for display); put a blank line between paragraphs.
- Do **not** insert Markdown hard line breaks (two trailing spaces before a newline, or a bare `<br>`) in ordinary prose.
- Structural newlines remain required for headings, list items, table rows, fenced code blocks, and blank lines that separate blocks.

Wrong (column-wrapped paragraph):

```markdown
Sandbox for plain LaTeX experiments without project-specific document classes.
Active scratch lives in `src/main.tex`; historical fragments sit under
`src/snippets/`.
```

Right (one paragraph, one line):

```markdown
Sandbox for plain LaTeX experiments without project-specific document classes. Active scratch lives in `src/main.tex`; historical fragments sit under `src/snippets/`.
```

## Header

The header of a plain text file shall be in alignment with the following exemplary templates:

- Text case (here, Markdown):

    ```markdown
    ---
    {{{Metadata in YAML syntax}}}
    ---

    ---

    ```

- Code case (here, shell script):

    ```sh
    # {{{Shebang or linter directive}}}

    # ---
    # {{{Metadata in YAML syntax}}}
    # ---

    # {{{Further important remarks}}}

    # ---

    ```

### YAML Metadata

Regardless of the number of spaces used for one level of indentation in the body of the file, the YAML syntax in the header uses indentation of two spaces.

Which key is required depends on the **kind** of file:

| Kind | Required key | Typical files |
|------|----------------|---------------|
| **Document / config / data** | `title` | Markdown notes, `.gitignore`, `.envrc`, YAML/TOML/INI configs, data sidecars |
| **Action script** (does work) | `description` | Shell/Python utilities, makers, cron wrappers, library helpers with logic |
| **Thin wrapper script** | `title` *or* `description` | Short `exec`/alias stubs that only set env and forward |

Do **not** require both. Prefer **only** the key that fits the kind (e.g. no `title:` on a normal action script).

- Optional are keys such as **tags**, **created**, etc.
- The value of the metadata key **title** should be in **Title Case**, e.g. `title: The Empire Strikes Back` if English and in **Standard Case**, e.g. `title: Das Imperium schlägt zurück` if German; other languages are not expected to occur, not even Klingon.
- The value of the metadata key **description** is a short phrase or folded block (`>-`) stating what the script does, in descriptive style (same voice as code comments, see below).
- The value of the metadata key **created** should be in the format `YYYY-MM-DD`, e.g. `created: 2026-05-24`.
- The value of the metadata key **tags** should be a list of strings such as:

    ```yaml
    tags:
      - foo
      - bar
    ```

Examples:

```sh
# Action script
# ---
# description: >-
#   Mirrors staged restic repos to the cloud remote
# ---
```

```sh
# Thin wrapper (title is enough)
# ---
# title: Dcd
# ---
```

```yaml
# Config / document front matter
---
title: Gitignore for Backup Tools
---
```

## Comments

- A comment annotating a single piece of code (often just a line) has to be put directly above this piece of code, i.e. there should not be any blank lines between them.
- Preferably, a comment annotating a single piece of code should be written in descriptive style (e.g. "Creates …") with omitted subject and not in an imperative style (e.g. "Create …")[^pep-exception]. The same style applies to annotations such as TODO, NOTE, WARNING, etc.
- **Full stops:** If the comment is a single sentence, do **not** end it with a full stop. Use full stops only when the comment contains more than one sentence (ordinary sentence punctuation between and after those sentences).
    - One sentence: `# Shows available recipes`
    - Several sentences: `# Resolves the query. Prefers review over staged.`

[^pep-exception]: There are exceptions like the docstring of Python or Emacs Lisp functions.

- Only the following markers shall be used, in uppercase and with closing colon:
    - `ENIGMA`: …[^bmtbk-earlier]
    - `TODO`: …
    - `NOTE`: …
    - `WARNING`: …

The general format is:
`[Comment Character(s)] [MARKER]: [Short sentence, possible paragraph]`

## Configuration Values

- Document each configuration value in comments directly above the setting.
- For Boolean values, use a single descriptive comment beginning with “Whether to”.
- For integer or string values with a fixed set of possibilities, introduce the
  setting with a comment ending in “possible values:” and list every supported
  value on the following comment lines as `${VALUE} = ${EFFECT}`.
- Keep the selected value directly below its documentation block so that the
  available choices and the active choice remain visible together.

[^bmtbk-earlier]: In earlier times, BMTBK was used: *beyond my totally bounded knowledge*.
