# LaTeX Conventions

Encoding, file structure, and comment style follow [plain-text.md](plain-text.md). The rules below apply to `.tex` sources in addition.

## White Spaces

- No white spaces between a command and its mandatory or optional arguments.
- In a keyval pair, no surrounding white spaces, to ensure proper parsing for all packages (e.g. `dataframe` is sensitive to them). Brace the value instead.

## Math Environments

- In `equation`, `align`, and similar environments with labelled or individually tagged lines, `\label` (and related commands) must precede `\tag`.
- In an `align` environment, a line break must follow `\\`; if there is only one left-hand side, separate it with a line break as well.

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
