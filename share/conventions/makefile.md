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
    Makes executables or scripts available, either by copying or creating symbolic links
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
