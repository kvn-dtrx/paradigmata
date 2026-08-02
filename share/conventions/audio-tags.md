# Audio Tag Conventions

## Tags

### General Tag Conventions

- Tags should be in IDv2.4 format. Particularly, all tags in IDv1 format have to be removed.
- The following characters should be avoided:

    `<`, `>`, `=`, `;` `:`, `&`, `|`, `\`, `/`

- Use plain blank spaces as separator, in particular, no tabs or protected white spaces.
- Fields are written in upper-case style.
- Only the following tags should be present—asterisk attached to mandatory ones:
    - `%acoustid-fingerprint%`
    - `%album%`\*
    - `%albumartist%`\*
    - `%artist%`\*
    - `%barcode%`
    - `%comment%`
    - `%composer%`
    - `%copyright%`
    - `%encoder%`
    - `%genre%`\*
    - `%isrc%`
    - `%mcn%`
    - `%musicbrainz-albumartistid%`
    - `%musicbrainz-albumid%`
    - `%musicbrainz-albumreleasecountry%`
    - `%musicbrainz-artistid%`
    - `%musicbrainz-discid%`
    - `%musicbrainz-releasegroupid%`
    - `%musicbrainz-releasetrackid%`
    - `%musicbrainz-trackid%`
    - `%publisher%`
    - `%replaygain-album-gain%`
    - `%replaygain-album-peak%`
    - `%replaygain-reference-loudness%`
    - `%replaygain-track--gain%`
    - `%replaygain-track-peak%`
    - `%title%`\*
    - `%track%`\*
    - `%year%`\*
    - `%warning%` (if Album is incomplete or has decoding errors)
- Use exclusively `%encoder%` (instead of `%encodedby%`).
- Save EAN or UPC to `%barcode%`.

### Single Field Conventions

- The `%artist%` field:
    - Featuring artist belong here, (and not in `%title%`)!
- The `$title` field:
    - If there is no true title for an album track, simply put `Track %track%`.
    - If a logical title spans over several true titles, append a numbering scheme as `, Teil <number>` or `, Part <number>`.
    - If a true title spans over several logical titles, join the logical title by `~`.
- The `%track%` field:
    - `%track%/%totaltracks%` for album tracks.
- The `%genre%` field:
    - For albums, the following values are allowed:
        - Audiobook
        - Classical
        - Comedy
        - Pop
        - Radiodrama
        - Rap
        - Rock
        - Soundtrack
        - Spoken Word
    - For singletons, the following values are valid:
        - American Metal
        - American Pop
        - American Rap
        - American Rock
        - British Pop
        - British Rock
        - Classical
        - Comedy
        - English Pop
        - European Pop
        - German Pop
        - German Rap
        - German Rock
        - Reggae
        - RnB
        - Schlager Music
        - Soundtrack
        - Techno
        - Trailer

- The `%year%` field:
    - This field is of the form `YYYY`.
    - Should be the publishing date of the album.

## Covers

A front cover is mandatory.

- Image Files:
    - Image type: JPEG (mime type `image/jpeg`), particularly, no `png` or `tif` files.
    - Width and height must be multiples of 8.
    - Progressive: False.
    - Only a front cover will be embedded, with dimensions 400 x 400 px (note that `mp3tag` can shrink now cover files to a specified size).

## Path And File Names

- The Directory Structure should be as follows: For every album artist, there should be a branch organised as follows:

    ```text
    .
    └── Albumartist
        ├── Album 1
        │   ├── Tracklist
        │   ├── Track 1
        │   ├── Track ...
        │   ├── Track m
        │   ├── Illustration 1
        │   ├── Illustration ...
        │   └── Illustration n
        ├── ...
        └── Album N
            ├── Tracklist
            ├── Track 1
            └── ...
    ```

- Only allowed additional material: Front Cover (as `front.jpg`), Back Cover (as `back.jpg`), Booklet (as `booklet01.jpg` and so on, … `booklet.pdf` or `booklet.txt`), Rip (as `rip01.log` and so on).
- General file and directory name conventions apply; see [path-names.md](path-names.md).
- File name for a track should be `$num(%track%,3)--%title%`.
- Directory name for an album should be `%album%@@%year%`.

## TODO

- Rewrite actions:
    - lowercase replacements make uppercase replacements unnecessary;
    - first remove characters such as `?`, `!`;
    - finally replace ` ` with `-`.
- Replace Soundtrack genre with the more precise Score.
- For soundtrack albums, move the soundtrack album designation into Caption; express Caption in the album name via initials.
- Singleton genres by mood: Radiomusik (Trivial English, German, Other), Depri, Push, Immersion, Stumpf, Alkohol.
