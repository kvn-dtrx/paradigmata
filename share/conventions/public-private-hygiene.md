# Public / Private Commit Hygiene

When a project has a **public forge surface** and also **semantically private** material (strategy notes, “for your consideration” discussion, partner-sensitive drafts), decide **placement** up front. Do not rely on a publish-time blacklist (the abandoned `.pubignore` idea) to repair a mixed history.

This is **prevention** (what may enter which history). It is not the same as secret scanning / `.gitignore` (credentials and build cruft), and not the same as **curation after the fact** (see below).

## Default rule

Pick one canonical working repository and make its visibility match what that history is allowed to contain:

| Canonical repo | Where private deliberation lives | Where the public product lives |
| --- | --- | --- |
| **Private** | In that same repo (or linked private notes) | Separate public repo, release archive, or deliberate export — not a rewritten “mirror” of the private identity |
| **Public** | Outside that history: private companion repo, vault, or private tracker | The public repo itself (tree and history stay publishable) |

Never treat “we will strip paths when mirroring” as a substitute for that choice.

## Hygiene checklist (before the first sensitive commit)

1. **Name the audience of the history** — anyone with clone access sees every committed path forever (forks, CI logs, old SHAs).
2. **Classify the artefact** — publishable product vs internal deliberation vs secret. Secrets never belong in any remote history; deliberation does not belong in a **public** canonical history.
3. **Choose locus** — private companion / other store for deliberation when the product repo is public; keep deliberation in-repo only when the canonical repo is private.
4. **Document the split** in the private side (short note is enough): what is public-canonical vs private-only, so agents and humans do not “helpfully” commit FYC material into the public tree.
5. **Optional export aids** — for snapshot releases from a private canonical repo, `.gitattributes` `export-ignore` is appropriate. That is export semantics, not an ongoing history rewrite.

## Anti-pattern

Do **not** maintain a path blacklist and repeatedly `git filter-repo` + `git push --mirror` to keep a “public twin” in sync. `filter-repo` rewrites identity; `--mirror` assumes isomorphic remotes. Together they fight the tools’ purpose and create a second, unstable history.

## Exception: material already in a history you must publish

If private-semantic paths already landed in history and a public cloneable history is still required:

1. Leave the private repo intact (canonical).
2. **Once** derive a public lineage (`git filter-repo` path removal, or an orphan tree without those paths).
3. From then on, maintain the public repo as its **own** line — cherry-picks, exports, or conscious copies — not as a filtered mirror of private `main`.

Prefer prevention next time over building a pipeline around this exception.
