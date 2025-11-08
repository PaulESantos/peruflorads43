# Direct Match Infraspecific Rank within Species

Performs direct matching of infraspecific rank (VAR., SUBSP., F., etc.)
within an already matched species. This is a prerequisite before fuzzy
matching the infraspecific epithet, as the rank category must match
exactly.

## Usage

``` r
direct_match_infra_rank_within_species(
  df,
  target_df = NULL,
  source = "original"
)
```

## Arguments

- df:

  A tibble containing the species data to be matched.

- target_df:

  A tibble representing the threatened species database.

- source:

  Character string specifying which database version to use. Options
  are:

  - `"original"` (default): Uses the original threatened species
    database

  - `"updated"`: Uses the updated database with synonyms

## Value

A tibble with an additional logical column \`direct_match_infra_rank\`
indicating whether the infraspecific rank was successfully matched
(\`TRUE\`) or not (\`FALSE\`).

## Details

This function ensures that the infraspecific category (e.g., VAR.,
SUBSP., F.) matches exactly before attempting fuzzy matching on the
infraspecific epithet. This prevents inappropriate matches like "var.
alba" matching with "subsp. alba" which, despite having similar
epithets, are taxonomically different entities.

The function automatically uses the correct column name based on
use_infraspecies_2: - TRUE: Uses 'tag' column (original DS 043-2006-AG
database) - FALSE: Uses 'tag_acc' column (updated nomenclature database)
