# PATH Umbrella CLIs

When a repository wires user-facing tools into `$PATH` (typically via `make install` / make-wire `mount.bin`), prefer **one short umbrella** command plus **subcommands**, not a flat swarm of memorisation-hostile names.

## Principle

| Surface | Role |
| --- | --- |
| **Umbrella** | Single PATH entry people remember (`baktl`, `…`) |
| **Subcommands** | Verbs / axes under that umbrella (`pull`, `backup`, `map`) |
| **Shims** | Optional legacy flat names that `exec` into the umbrella |

Do not invent a new top-level binary for every feature. Add a subcommand
(or nested args) under the umbrella instead.

## Naming the umbrella

- Short mnemonic from the **product domain**, not the full repo slug
  (`backup-tools` → `baktl`; avoid `backup-tools` on PATH).
- Prefer **4–6 letters**, lowercase, no hyphens (easy to type).
- One umbrella per PATH-wired product repo (not one per internal tool).

## Subcommand shape

Prefer readable axes over opaque compounds:

```text
<umbrella> <verb> [<from|to> [<what>]] [flags…] [args…]
```

Examples (backup-tools):

```text
baktl pull nas media [DATASET…]
baktl push -t restic -m workstation_to_nas -d documents
baktl map
baktl help
```

Directional verbs relative to the **workstation operator**:

| Verb | Meaning |
| --- | --- |
| `pull` | Fetch toward the workstation |
| `push` | Send away / run a backup scheme (`backup` may alias `push`) |
| `restore` / `retrieve` | Bring back from a backup store |
| `check` / `retain` / `prune` | Maintenance (keep existing matrix CLIs behind these) |

`pull` / `push` take **where** then **what** (`nas media`, not `media-pull`).

## Shims and compatibility

- Existing flat PATH names may remain as thin wrappers that call the
  umbrella (so scripts and muscle memory keep working).
- New features ship only under the umbrella; do not add new flat names
  without a shim → umbrella mapping.
- Just recipes may call the same scripts the umbrella calls; document
  the umbrella form in `just map` / README first.

## Installation

- Umbrella lives under `src/wire/bin/` (or the repo’s public bin mount)
  and is installed like any other PATH stub.
- Help: `<umbrella>` / `<umbrella> help` / `<umbrella> -h` lists
  subcommands; each subcommand supports `-h` where useful.

## Anti-patterns

- `foo-pull-scheme`, `foo-bar-baz-scheme` as the only public name
- Cryptic two/three-letter aliases without an umbrella path (`dcf`)
  unless they remain shims to a documented subcommand
- Multiple umbrella names for the same product (`baktl` + `backup-tools`
    - `bt` competing on PATH)
