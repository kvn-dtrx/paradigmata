# Shell Conventions

Applies to Bourne-like shells (POSIX `sh`, Bash, Zsh) and to shell-like
assignment forms outside scripts — notably `config/wire.ini` (`key = value`).

## Parameter bracing

Named parameters are **always** written with braces:

```sh
"${name}"
"${HOME}/data"
```

Never write bare `$name` / `$HOME` for named parameters. Braces avoid
accidental glue with following characters (`$foobarmount` vs `${foo}barmount`)
and make the expansion boundary explicit.

Allowed without brace-named form (special / positional / syntax):

| Form | Role |
|------|------|
| `$1` … `$9`, `${10}`, … | Positional parameters (`${1}` is also fine) |
| `"$@"`, `"$*"` | Argument lists |
| `$#`, `$?`, `$!`, `$$`, `$0` | Special parameters |
| `$(…)` / `` `…` `` | Command substitution |
| `$((…))` | Arithmetic expansion |

Prefer `"${1}"` when a positional sits next to other text.

## Assignment quoting

Default form for assignments that carry a value:

```sh
key="${val}"
path="${HOME}/data"
```

| Form | When |
|------|------|
| `key="${val}"` / `key="…${VAR}…"` | **Default.** Double quotes: expand parameters/`$(…)` and keep the result one word, so spaces from expansion cannot split the value. |
| `key='literal'` / `key='…${VAR}…'` | No expansion and no interpretation of `$`, backticks, or `\`. Use when the text must stay literal. |
| `key=simple` (unquoted) | Allowed only when expansion cannot inject whitespace (and the value has none): plain tokens without `${…}`, or a known-safe pattern. Prefer quotes whenever unsure. |

Do **not** write unquoted `${VAR}` in assignments or list contexts when the
expanded value might contain spaces (home directories, paths, user input).

### Examples

```sh
# Good — braced, expansion, whitespace-safe
root="${MY_LOCAL_HOME}/libexec/backup-tools"
dest="${HOME}/Documents"

# Good — intentionally literal (no expand)
label='raw ${HOME} text'

# Good — no expansion, no whitespace risk
mode=symlink
from=src/wire

# Bad — bare named parameter (always brace)
root="$HOME/data"

# Bad — braced but unquoted (expansion may split on spaces)
root=${HOME}/data
```

### `wire.ini`

Same bracing and quoting rules. Parser (`make-wire`) strips one matching outer
quote pair; single-quoted values are not expanded, double-quoted and bare
values are. Named expansions in values must use `${…}` (not `$NAME`).

```ini
[mount.libexec]
from = src/wire
root = "${MY_LOCAL_HOME}/libexec/example"
mode = symlink
```
