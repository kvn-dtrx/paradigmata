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

- Mandatory is the key **title**.
- Optional are keys such as **tags**, **created**, etc.
- The value of the metadata key **title** should be in **Title Case**, e.g. `title: The Empire Strikes Back` if English and in **Standard Case**, e.g. `title: Das Imperium schlägt zurück` if German; other languages are not expected to occur, not even Klingon.
- The value of the metadata key **created** should be in the format `YYYY-MM-DD`, e.g. `created: 2026-05-24`.
- The value of the metadata key **tags** should be a list of strings such as:

    ```yaml
    tags:
      - foo
      - bar
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

[^bmtbk-earlier]: In earlier times, BMTBK was used: *beyond my totally bounded knowledge*.
