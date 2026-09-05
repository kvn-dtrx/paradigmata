# Makefile Conventions

## Working Directory

A Makefile always runs with its parent as working directory; therefore, no "rerouting" to the project root is necessary—at least for the main Makefile of a project.

## Variables

The Makefile syntax provides different assignment operators:

- `:=`: Assign with immediate evaluation
- `=`: Assign with deferred evaluation
- `?=`: Assign if left hand side is not yet bound
- `+=`: Assigns the sum of left and right hand side to the left hand side

Contrary to the shell scripting syntax, the right hand side shall not be embraced with quotes:

```makefile
foo = bar
baz = $(foo) qux
```

In embedded shell commands, such variables are called with double dollar sign, e.g. `"$${baz}"`. Here, in order to avoid word splitting, quotation is necessary, again.

## Line Continuation

The continuation of lines must be marked explicitly:

```makefile
foo:
	@for file in dir/to/files/*; do \
		echo "$$(foo)" \
	done
```

## Conventions for Targets

Across `~/data/projects`, Make is for setup/install (system paths, venv, stubs, config deploy). Recurring ops and document builds belong in a `justfile` (`just --list`).

### Installation taxonomy

Installation targets describe their destination and audience:

```yaml
- name: install
  description: >-
    Compatibility alias for `install-user`. It contains no installation recipe
    of its own.
- name: install-user
  description: >-
    Deploys runtime files into the current user's environment, such as XDG,
    TEXMFHOME, or ~/.local. Copy versus symlink is repository or mount policy.
- name: setup-dev
  description: >-
    Prepares checkout-local development state, such as an editable virtual
    environment or Git hooks. It never deploys user or root files.
- name: install-root
  description: >-
    Deploys files owned by root or into root-controlled paths and may require
    elevated privileges. It is always explicit.
```

Keep the alias visible and recipe-free:

```makefile
.PHONY: install install-user setup-dev

install: install-user ## Alias for install-user

install-user: ## Symlinks commands into ~/.local/bin
	@python3 bin/make-wire.py "$(CURDIR)"

setup-dev: ## Installs repository-local Git hooks
	@bin/install-git-hooks.sh
```

These targets describe ownership, not materialisation. An `install-user` target
may copy or symlink according to the repository's `wire.ini`; expose a separate
mode override only when both lifecycles are genuinely supported. `setup-dev`
owns only checkout-local state and is therefore not an installation variant.
Run `install-user` and `setup-dev` explicitly when both are wanted.

There is deliberately no universal `install-all`: composing destinations hides
side effects and makes privileged installation too easy to trigger. Root-only
repositories omit `install` rather than weakening its invariant; root actions
must be requested through an explicitly named `install-root*` target.

### Justfile recipe comments

Recipe (and variable) comments follow [plain-text.md](plain-text.md): one descriptive line directly above the recipe, omitted subject. A single-sentence comment has **no** trailing full stop; full stops appear only in multi-sentence comments.

```just
# Shows available recipes
default:
    @just --list --unsorted

# Builds the main PDF document
build:
    …
```

Do not use imperative one-liners (`# Show …`, `# Build …`).

Standard target names when Make is used:

```yaml
- name: help
  description: >-
    Displays available targets with description
- name: setup
  description: >-
    Prepares the environment or dependencies. Typical subtasks are: virtual environments, package installation, prerequisites check.
- name: apply
  description: >-
    Performs the principal project tasks, e.g., compilation, scripts, data transformations. Should not modify system paths or deploy artefacts.
- name: install
  description: >-
    Alias for `install-user`
- name: install-user
  description: >-
    Makes executables or scripts available to the current user, either by copying or creating symbolic links
- name: setup-dev
  description: >-
    Prepares repository-local development state
- name: install-root
  description: >-
    Installs into root-owned paths or services
- name: all
  description: >-
    Runs `setup`, `apply`, and `install` in sequence
- name: clean
  description: >-
    Removes temporary files or build artefacts
- name: purge
  description: >-
    Runs `clean` and removes builds
- name: uninstall
  description: >-
    Reverts `install`. Removes deployed files, binaries, or symlinks.
- name: reset
  description: >-
    Reverts `setup`
```
