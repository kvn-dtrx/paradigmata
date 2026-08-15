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

## ShellCheck

Scripts under `*.sh` / `*.bash` / `*.zsh` must stay clean under [ShellCheck](https://www.shellcheck.net/). Prefer fixing the code; do not silence findings casually.

### Invocation

ShellCheck dialects are `sh`, `bash`, `dash`, `ksh` (and busybox) — **there is no `zsh` dialect**. Check Bourne-like scripts as bash (or `sh` when strictly POSIX):

```sh
shellcheck --exclude=SC1103 --shell=bash -- **/*.bash **/*.sh **/*.zsh
```

`SC1103` (prefer `source` over `.`) is excluded project-wide: we keep `.` for POSIX-friendly sourcing.

User-wide Git pre-commit (Dotfiles `repolicy/pre-commit.tsv` → Repolicy Git adapter → `shellcheck-clean.bash`) runs the same flags on **staged** `*.sh` / `*.bash` / `*.zsh`. Install `shellcheck` on `PATH`; if missing, the check skips with a warning. Hook layering: [git-hooks.md](git-hooks.md).

For **zsh-only** syntax (`${(q)…}`, `always {…}`, anonymous `() {…}` hooks, …), ShellCheck will misparse under bash. Either:

1. rewrite to a bash-checkable shape when easy, or
2. disable the specific codes with an explicit **zshism** reason (below)

Do not pretend `# shellcheck shell=zsh` works — it is not a valid dialect.

### Empty prefix assignments (`SC1007`)

Clear an env var for one command with an explicit empty string:

```sh
# Good
repo="$(CDPATH='' cd -- "$(dirname "${0}")/.." && pwd)"

# Bad — ShellCheck SC1007
repo="$(CDPATH= cd -- "$(dirname "${0}")/.." && pwd)"
```

### Disabling a rule

When a finding is intentional and cannot be rewritten cleanly, disable **narrowly** and **name the reason** on the same directive line (or the next comment line). Never leave a bare disable.

```sh
# shellcheck disable=SC1091
. "${repo}/.env"

# shellcheck disable=SC2034
EXPORT_ONLY="${value}"

# shellcheck disable=SC2296
query="${(qqq)LBUFFER}"
```

Prefer:

1. Fix the code
2. File- or function-scoped `# shellcheck disable=SCxxxx  # reason`
3. Next-line disable only for a single statement

**Infos/notes** (SC1091, SC2016, SC2086, …) are not ignored by default — silence them the same way with an explicit reason (e.g. `dynamic source; not shipped as input`, `intentional single-quoted trap/remote template`).

Do **not** use `# shellcheck disable=all`. Do **not** disable without a short reason. Rule breaks that exist only because the file is zsh must say `zshism:` in the reason. Helper libraries that assign variables for sourced consumers may disable SC2034 with `for sourced consumers` when ShellCheck is run without `-x`.
