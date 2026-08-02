# Conventional Commit Format

> \<Type\>(Scope\[optional\]): Short Summary
>
> Body\[optional\]
>
> Footer\[optional\]

## Short Summary

- Keep to 50 characters or less.
- Use the imperative mood (e.g., "Add", not "Added").
- Use title case.
- Do not end with punctuation (no period).

## Type

- `feat`: Introducing a new feature.
- `fix`: Correcting a bug.
- `docs`: Documentation-only changes.
- `style`: Formatting, no code logic change.
- `refactor`: Code restructuring, no new behaviour.
- `perf`: Improving performance.
- `test`: Adding or updating tests.
- `chore`: Tooling, config, or build changes.

## Scope \[optional\]

A brief identifier for the affected area (e.g., `auth`, `db`, `cli`).

## Body \[optional\]

- Explain what changed and why.
- Use full sentences.
- Wrap lines around 72 characters.

## Footer \[optional\]

- Use for extra context or automation cues.
- To mark breaking changes, e.g.:
    > BREAKING CHANGE: \<description and rational of changes\>.
- To link related issues, e.g.:
    > Closes: #123
    Or:
    > Fixes: #456
- One footer per line, after the body.
