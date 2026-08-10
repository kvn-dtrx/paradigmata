#!/usr/bin/env bash

# ---
# description: >-
#   Removes Cursor and Codex skill symlinks published by this repo's wire home mount.
# ---

# ---

set -o errexit
set -o nounset
set -o pipefail

repo_dir="$(cd "$(dirname "${0}")/.." && pwd)"
removed=0
for skills_root in "${HOME}/.cursor/skills" "${HOME}/.codex/skills"; do
    for skill_dir in "${repo_dir}/share/skills"/*/; do
        [ -d "${skill_dir}" ] || continue
        name="$(basename "${skill_dir}")"
        dest="${skills_root}/${name}"
        if [ -L "${dest}" ]; then
            target="$(realpath "${dest}" 2>/dev/null || true)"
            if [ "${target}" = "$(realpath "${skill_dir}")" ]; then
                rm -f -- "${dest}"
                printf 'removed %s\n' "${dest}"
                removed=1
            fi
        fi
    done
done

if [ "${removed}" -eq 0 ]; then
    printf 'No matching Cursor or Codex symlinks under %s\n' "${HOME}" >&2
fi
