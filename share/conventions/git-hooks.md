# Git hooks (native)

Native Git hooks — not the [pre-commit](https://pre-commit.com/) Python framework.

## Default vs `core.hooksPath`

Git’s **default** hook directory is **`.git/hooks` per repository**.

A user-wide directory such as `~/.config/git/hooks` is used **only** when
`core.hooksPath` is set (for example in a Dotfiles Git capsule). Without that
setting, files under `~/.config/git/hooks` are ignored.

Git executes only files whose **basename matches the hook type**
(`pre-commit`, `commit-msg`, `pre-push`, …). Sibling policy files such as
`pre-commit.tsv` are **not** executed.

## Layering

| Layer | Where | Role |
| --- | --- | --- |
| Policy (TSV catalogs) | Dotfiles `repolicy` capsule → `~/.config/repolicy/*.tsv` | Which steps run, in order |
| Entry hooks | Repolicy `git-hooks/` (via `core.hooksPath`) | Optional `.git/hooks/<type>` override; invoke catalog runner |
| Runner + rules | `repolicy` → `~/.local/libexec/repolicy/` | Execute `cli` / `rule` / `action` rows |
| Format CLIs | `shell-scripts` `sanitise-*` on `PATH` | Independent tools; hooks call them as `cli` rows |

Do **not** hardcode step lists in entry-hook Bash. Do **not** point hooks at a
clone path; use the installed libexec tree after `make install` in Repolicy.

## TSV catalogs

One file per hook type next to the entry executable, tab-separated:

```text
# kind<TAB>target<TAB>args
cli<TAB>sanitise-text<TAB>--staged
cli<TAB>check-shell<TAB>--staged
cli<TAB>check-python<TAB>--staged
```

| kind | target | Notes |
| --- | --- | --- |
| `cli` | command on `PATH` | Missing → warn + skip; non-zero exit aborts the hook |
| `rule` | shared validation under `…/libexec/repolicy/rules/` | Git adapter supplies staged paths, branch, or message |
| `action` | explicit mutation under `…/libexec/repolicy/actions/` | Kept distinct from validation rules |

Prefer TSV over YAML for this flat ordered list (no nested policy yet).

ShellCheck for check scripts: [shell.md](shell.md).
