# YAML Conventions

## Personal Listings

Personal enumeration files (e.g. under Synerga `notes/`) are split into `head`
and `body`, separated by a comment line `# ---`:

```yaml
head:
  title: …
  created: YYYY-MM-DD
  category: …
  description: >-
    …
  remark: …
  sort-by:
    - key: …
      descending: true
# ---
body:
  - …
```

### `head` key order

Use this order when present:

1. `title`
2. `created`
3. `category`
4. `description`
5. `remark`
6. `sort-by`

Omit keys that are unused; do not invent a different order.
