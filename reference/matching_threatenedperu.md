# Match Species Names to Threatened Plant List of Peru

This function matches given species names against the internal database
of threatened plant species in Peru. It uses a hierarchical matching
strategy that includes direct matching, genus-level matching, fuzzy
matching, and suffix matching to maximize successful matches while
maintaining accuracy.

## Usage

``` r
matching_threatenedperu(
  splist,
  source = c("original", "updated"),
  quiet = TRUE
)
```

## Arguments

- splist:

  A character vector containing the species names to be matched. Can
  include duplicate names - results will be expanded to match the input.

- source:

  Character string specifying which database version to use. Options
  are:

  - `"original"` (default): Uses the original threatened species
    database with support for Rank 4 (quaternomial names)

  - `"updated"`: Uses the updated database with current nomenclature,
    supporting up to Rank 3 (trinomial names)

- quiet:

  Logical, default TRUE. If FALSE, prints informative messages.

## Value

A tibble with detailed matching results including:

- sorter:

  Integer. Original position in input vector

- Orig.Name:

  Character. Original input name (standardized)

- Matched.Name:

  Character. Matched name from database or "—"

- Threat.Status:

  Character. IUCN threat category or "Not threatened"

- Rank:

  Integer. Input taxonomic rank (1-4)

- Matched.Rank:

  Integer. Matched taxonomic rank

- Comp.Rank:

  Logical. Whether ranks match exactly

- Match.Level:

  Character. Description of match quality

- matched:

  Logical. Whether a match was found

## Details

\*\*Duplicate Handling:\*\* When the input contains duplicate names, the
function automatically:

- Detects duplicates and creates a tracking column (sorters)

- Processes only unique names (efficient matching)

- Expands results to restore all original positions

- Preserves original input order via sorter column

The duplicate handling uses a \`sorters\` column that concatenates all
original sorter values for duplicate names (e.g., "1 - 3" for a name
appearing at positions 1 and 3), enabling accurate result expansion.

\*\*Matching Strategy:\*\* 1. Direct exact matching 2. Genus-level
matching (exact and fuzzy) 3. Species-level matching within genus 4.
Infraspecies-level matching (up to 2 levels for original database)

\*\*Rank Validation:\*\* The algorithm implements strict rank validation
to prevent false positives.

## See also

[`is_threatened_peru`](https://paulesantos.github.io/peruflorads43/reference/is_threatened_peru.md)
for a simplified interface
[`get_ambiguous_matches`](https://paulesantos.github.io/peruflorads43/reference/get_ambiguous_matches.md)
to retrieve ambiguous match details
[`get_threatened_database`](https://paulesantos.github.io/peruflorads43/reference/get_threatened_database.md)
to access the raw databases

## Examples

``` r
if (FALSE) { # \dontrun{
# Basic usage
species_list <- c("Cattleya maxima", "Polylepis incana")
results <- matching_threatenedperu(species_list, source = "original")

# With duplicates
species_dup <- c("Cattleya maxima", "Polylepis incana", "Cattleya maxima")
results_dup <- matching_threatenedperu(species_dup)
nrow(results_dup) == 3  # TRUE - preserves duplicates

# Access metadata
attr(results, "match_rate")

# Check for ambiguous matches
get_ambiguous_matches(results, type = "infraspecies")
} # }
```
