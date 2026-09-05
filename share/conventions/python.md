# Python Conventions

Encoding, file header, and comment style follow [plain-text.md](plain-text.md).
The body of a Python module or script is organised with the following section
markers (omit empty sections):

```python
# --- Imports ---

{{{…}}}

# --- Configuration ---

{{{…}}}

# --- Auxiliary Code ---

{{{…}}}

# --- Main Code ---

{{{…}}}
```

## Project-root discovery

Use `.mtdt.yaml` as the project-root anchor. Walk upwards in the program itself
so root discovery does not add a dependency on Git or a project-specific
package:

```python
def find_project_root(start: Path) -> Path:
    for directory in (start, *start.parents):
        if (directory / ".mtdt.yaml").is_file():
            return directory
    raise FileNotFoundError(f"No .mtdt.yaml found above {start}")

project_root = find_project_root(Path.cwd())
```

Start at `Path(__file__).resolve().parent` when discovery must be independent of
the caller's working directory. Use Git root discovery only when the Git
worktree itself is the data being queried.
