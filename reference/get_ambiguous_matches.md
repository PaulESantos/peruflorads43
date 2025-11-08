# Retrieve Ambiguous Match Information

Extracts information about ambiguous matches (multiple candidates with
tied distances) from matching results. This is useful for quality
control and manual curation of uncertain matches.

## Usage

``` r
get_ambiguous_matches(
  match_result,
  type = c("genus", "species", "infraspecies", "all"),
  save_to_file = FALSE,
  output_dir = tempdir()
)
```

## Arguments

- match_result:

  A tibble returned by matching functions such as
  [`matching_threatenedperu`](https://paulesantos.github.io/peruflorads43/reference/matching_threatenedperu.md)
  or internal matching functions.

- type:

  Character. Type of ambiguous matches to retrieve:

  - `"genus"` (default): Ambiguous genus-level matches

  - `"species"`: Ambiguous species-level matches

  - `"infraspecies"`: Ambiguous infraspecies-level matches (includes
    level 2)

  - `"all"`: All types of ambiguous matches

- save_to_file:

  Logical. If TRUE, saves results to a CSV file. Default is FALSE (CRAN
  compliant - no automatic file writing).

- output_dir:

  Character. Directory to save the file if save_to_file = TRUE. Defaults
  to [`tempdir()`](https://rdrr.io/r/base/tempfile.html) for safe file
  operations.

## Value

A tibble with ambiguous match details, or NULL if no ambiguous matches
exist. Columns depend on the match type but typically include original
names, matched names, and distance metrics.

## Details

During fuzzy matching, multiple candidates may have identical string
distances, making the choice of match ambiguous. The matching algorithm
automatically selects the first candidate, but this function allows you
to:

- Review all ambiguous matches for quality control

- Export them for manual curation

- Make informed decisions about match quality

## File Output

When `save_to_file = TRUE`, a timestamped CSV file is created:

- Filename format:
  "threatenedperu_ambiguous\_\[type\]\_\[timestamp\].csv"

- Location: `output_dir` (defaults to tempdir())

- Contains all ambiguous matches with metadata
