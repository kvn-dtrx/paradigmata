# Variable Name Conventions

## Common Concepts / Internal Variables

| Concept | Suggested format |
| --- | --- |
| Loop index / iterator | `i`, `j`, `k`, `*_idx`, `*_num` |
| Temporary variables | `tmp`, `tmp_*` |
| File handles/descriptors | `fh_*`, `file_*` |
| Generic value placeholders | `val`, `item`, `entry` |
| Constants | `MAX_*`, `MIN_*`, `DEFAULT_*` |
| Configuration/settings | `config_*`, `settings_*` |

### Remarks

- Constants and configuration variables often follow separate conventions (e.g., `UPPER_SNAKE_CASE`) to signal immutability.

## Primitive Types

Sometimes, it is necessary to distinguish between different types of the same "Platonic" variable. Then, the following table provides a proposal for the suffixes:

| Type | Suggested format |
| --- | --- |
| Integer | `*_count`, `*_idx`, `*_id` |
| Float | `*_ratio`, `*_score`, `*_value`, `*_factor` |
| Complex | `*_cmplx` |
| Boolean | `is_*`, `has_*`, `enable_*`, `allow_*` |
| String | `*_str` |
| List/Array | `*_list`, `_tuple`, `_vector`, `_array`, `_set` |
| Dictionary/Map | `*_map`, `*_dict` |

### Remarks

- In modern typed languages (Python ≥3.5, Rust, etc.), explicit suffixes for type are often redundant because type hints convey the type.
- For strings, avoid using `*_str` unless differentiation from other types is necessary; descriptive names are sufficient.
- For lists, prefer plural nouns, e.g. `users`.
- For dictionaries, prefer `<value>_by_<key>` to indicate mapping direction, e.g. `username_by_id`. Often, it is acceptable to name the dictionary after just the value collection, e.g. `users`. Avoid naming a dictionary solely after the key, e.g. `id_map`.

## Files and Directories

| Role | Variable |
| --- | --- |
| Input/Output file | `input_file`/`output_file` |
| Source/Destination file | `src_file`/`dst_file` |
| Input/Output directory | `input_dir`/`output_dir` |
| Source/Destination directory | `src_dir`/`dst_dir` |
| Temporary file/directory | `tmp_file`/`tmp_dir` |
| Cache/Working directory | `cache_dir`/`work_dir` |

### Remarks

- The difference between the input/output pair and source/destination pair can be expressed as follows: input/output *transforms* content whereas source/destination *transfers* content. Nevertheless, it is also valid to employ source/destination consistently in any context.
- The identifier of the shell environment variable for the temporary directory of the OS is `TMPDIR`.
- If necessary, the general mode of artefact type attachment is prefixing, e.g. `pdf_input_file` or `jpg_dst_dir`. Nevertheless, `tmp_` always takes precedence, e.g. `tmp_pdf_file`.

## Appendix: File and Directory Components

For files with extensions, the following decompositions are used:

- `filepath` = `parent` + `/` + `filename`
- `filename` = `stem` + `.` + `extension`
- `filepath` = `base` + `.` + `extension`
- `base` = `parent` + `/` + `stem`

For directories and files without extensions, the analogous decomposition to filename and base are redundant.
