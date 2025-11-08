# Helper: Direct Match Infraspecific Rank within Species

Helper function that performs the actual matching of infraspecific ranks
for a single matched species. Automatically handles both original and
updated databases by using the appropriate column name (tag or tag_acc).

## Usage

``` r
direct_match_infra_rank_within_species_helper(
  df,
  target_df,
  source = "original"
)
```

## Arguments

- df:

  A tibble containing data for a single matched species.

- target_df:

  A tibble representing the threatened species database.

- source:

  Character string specifying which database version to use. Options
  are:

  - `"original"` (default): Uses the original threatened species
    database

  - `"updated"`: Uses the updated database with synonyms

## Value

A tibble with match results and logical indicator.

## Details

The function performs the following steps: 1. Determines which column to
use based on use_infraspecies_2 2. Extracts infraspecific ranks from the
database for the matched species 3. Standardizes rank names to uppercase
4. Performs exact matching on the rank category 5. Returns matched and
unmatched records with boolean indicator
