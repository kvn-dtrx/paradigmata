# Conventions for Path Names—Directories and Files

## General Path Names

### Nomenclature

An arbitrary path has the shape `root/…/parentdir/filecore.fileextension` where furthermore, …

- `filename` is `filecore.fileextension`.
- `fileroot` is `root/…/parentdir/`.
- `filebase` is `root/…/parentdir/filecore`.

### General Advice

Do not invest too much energy and time in building cathedrals of sophisticated directory structures as it is a truism that any such structure eventually fails. Give pithy file names and put trust in such tools as `fd`, `rg` or `rga`.

## General File and Directory Names

Compare with <https://www.mtu.edu/umc/services/websites/writing/characters-avoid>.

### Prefixes

- For sorting a file/directory to the top, prepend `_`.

### File name components

Adopt the [denote](https://protesilaos.com/emacs/denote) file naming scheme. The file name components are as follows:

- `${DATE}`: `%Y%M%D-%H%m%s`, prepended by `@@` when not at the beginning of the file name. If a date component is irrelevant, it can be omitted from ${DATE}, e.g. if time is irrelevant, `%Y%M%D` (or `@@%Y%M%D`, respectively) is fine. If a date component is unknown but actually relevant (particularly, when ${DATE} is the first component of the name), replace each digit by an `x`. Note that we do not use `T` but `-` as separator between day and hour.
- `${SIGNATURE}`: Use it to establish a sequential relation between files, prepended by `==` when not at the beginning of the file name.
- `${TITLE}`: Clear, prepended by `--` when not at the beginning of the file name.
- `${TAGS}`: Always prepended by `__`. Currently in use:
    - incomplete
    - mtdt-dfcnt (metadata deficient)
    - new
    - old
    - sic

### Problematic Characters

| Character / Concept | Issue Type | Explanation |
| --- | --- | --- |
| Line breaks (LF/CR) | Structural | Line breaks are invalid or highly problematic in filenames and break most tooling. |
| Whitespace | Semantic | Used as an argument separator on Unix CLIs; requires consistent quoting or escaping. |
| Non-ASCII characters (such as umlauts, `§`) | Encoding | May cause encoding and locale issues; sometimes difficult to enter or transport reliably. |
| `:` | Platform-specific | Forbidden in Windows filesystems; often semantically overloaded elsewhere. |
| `<`, `>` | Platform / Shell | Forbidden in Windows; reserved for input/output redirection on Unix shells. |
| `"` | Platform / Shell | Forbidden in Windows; used for expandable quoting on Unix shells. |
| `'` | Shell syntax | Allowed on filesystems, but used for strong quoting on Unix shells; complicates safe command construction. |
| `\|` | Platform / Shell | Forbidden in Windows; used as the pipe operator on Unix shells. |
| `?` | Platform / Shell | Forbidden in Windows; wildcard for exactly one character on Unix shells. |
| `%` | Storage-specific | Forbidden or problematic in some cloud storage systems. |
| `#` | Shell syntax | Marks the beginning of a line comment on Unix shells. |
| `*` | Platform / Shell | Forbidden in Windows; wildcard for arbitrary strings on Unix shells. |
| `/` | Platform | Forbidden in Windows; directory separator on Unix systems. |
| `\` | Platform / Shell | Directory separator in Windows; escape character on Unix shells. |
| `.` | Conventional | Separator for file extensions; semantically meaningful but not forbidden. |
| `;` | Shell syntax | Command separator in shell code. |
| `=` | Shell syntax | Assignment operator for shell and environment variables. |
| `&` | Shell syntax | Sends commands to the background; logical AND operator. |
| `[`, `]` | Shell syntax | Used for character classes in globs and regular expressions. |
| `(`, `)` | Shell syntax | Used for grouping commands and spawning subshells. |
| `{`, `}` | Shell syntax | Used for brace expansion and command grouping. |
| `~` | Shell expansion | Triggers tilde expansion (home directory) when unquoted and word-initial. |
| `-` | Convention / Tooling | Prefix for options on Unix CLIs; problematic for Python module names. |

Conclusion: To avoid any possible problem, one should confine file and directory names to `a-z`, `A-Z` (but many file systems are not case sensitive!), `0-9` as well as further ASCII characters such as `-` (but not initial), `_`, `.`, `@`, `=`.

### File Extension

File extensions should always be typed in lower-case letters. This is not just a matter of taste, contravention can lead to problems (e.g. with `bib` or `tex` files)!

### Singular vs. Plural, `-` vs `_`, `+`

- Use plural nouns for directory names (e.g. `albums` instead of `album`), as directories typically denote collections.
- For separating words in filenames intended for human consumption, use the hyphen (`-`)  by default.
- In particular, where natural language would use separators such as “ – ”, “: ”, “. ”, “! ”, or “? ”, normalise to `-`.
- Use  `+` instead of `&`, `and`, `und` etc. to avoid shell metacharacters and information-sparse language-specific words.
- Nevertheless, for scripts, modules, and identifiers, prefer the underscore `_` over the hyphen `-` whenever it is requisite to comply with:
    - POSIX shell variable naming rules
    - Python module and identifier conventions

## Specific File and Directory Names

### Private Photos

- The pattern of the file name is `${DATE}--${TITLE}==${INDEX}.${EXTENSION}`.
- The pattern of `${DATE}` is `%Y%m%dt%H%M%S` (only a datetime separator!). It is set to the stated shooting date in the document (not the creation date of the file).
- The field `${TITLE}` contains the model of the digital camera.
- The field `${INDEX}` is optional (but the format has to be determined)!

### Publications like Books, Articles

- The pattern of the file name is `${INDEX}--${TITLE}@@${DATE}.${EXTENSION}`.
- The field `${INDEX}` contains the names of authors (or editors), following the pattern `${NAME}[+${NAME}]` (hence `+` in `${NAME}` is not allowed), and `${NAME}` follows the pattern `${GIVEN_NAME}_${SURNAME}[-${SURNAME}]` (hence `_` in `${GIVEN_NAME}` or `${SURNAME}` is not allowed).
- The field `${TITLE}` follows the pattern `${PUBLICATION_TITLE}[_${PUBLICATION_SUBTITLE}]` (hence `_` in `${PUBLICATION_TITLE}` or `${PUBLICATION_SUBTITLE}` is not allowed).
- The pattern of `${DATE}` is simply `%Y%`. It is set to the stated publication date in the document (not the creation date of the file).

### Documents

- The pattern of the file name is `${DATE}--${TITLE}=={INDEX}[__{TAG}…].{EXTENSION}`.
- The pattern of `${DATE}` is `%Y%m%d` (no separators!). It is set to the stated creation date in the document (not the creation date of the file).

### Audio and Video Files

Compare with [audio-tags.md](audio-tags.md).
