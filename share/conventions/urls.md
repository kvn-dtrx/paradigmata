# URL Conventions

## General Form

- Prefer the canonical URL published by the target. Avoid links that merely redirect to it.
- Prefer HTTPS when the target canonically supports it. Do not change schemes mechanically when availability or semantics are unknown.
- Write a bare origin with an explicit root path: `https://example.org/`, not `https://example.org`.
- Preserve the target's canonical trailing-slash form for every non-root path. `/article` and `/article/` can identify different resources and must not be normalised mechanically.
- Write concrete file resources without an added trailing slash, for example `https://example.org/report.pdf`.
- Place a query or fragment after the canonical path. A query on an origin therefore uses the explicit root path, for example `https://example.org/?page=2`.

## Archived and Opaque URLs

- Preserve Wayback Machine replay URLs exactly as returned for the selected snapshot. The embedded original URL after `/web/${TIMESTAMP}/` is part of the archive lookup and follows the captured form, not the surrounding repository style.
- Preserve opaque, signed, expiring, authentication, callback, API, and webhook URLs unless their provider documents an equivalent canonical form. Even apparently cosmetic changes can invalidate them.
- Do not rewrite URLs in generated files, dependency locks, vendored sources, fixtures, or protocol conformance examples solely for style.

## Verification

- Resolve the canonical form from an authoritative target, an HTTP redirect, or published metadata rather than guessing from whether a path resembles a file or directory.
- After changing URLs, run the repository's link checker where available.
- If the target is unavailable and no authoritative canonical form can be established, preserve the existing URL.

## Examples

| Kind | Preferred form |
| --- | --- |
| Origin | `https://example.org/` |
| Canonical slash route | `https://example.org/articles/` |
| Canonical slashless route | `https://example.org/articles` |
| File | `https://example.org/report.pdf` |
| Root query | `https://example.org/?q=term` |
| Wayback replay | Exact snapshot URL returned by Wayback |
