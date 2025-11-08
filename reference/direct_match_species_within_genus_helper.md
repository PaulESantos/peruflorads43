# Direct Match Species within Genus

This function performs a direct match of specific epithets within an
already matched genus from the list of threatened species in the
database.

## Usage

``` r
direct_match_species_within_genus_helper(df, target_df)
```

## Arguments

- df:

  A tibble containing the species data to be matched.

- target_df:

  A tibble representing the threatened species database containing the
  reference list of threatened species.

## Value

A tibble with an additional logical column indicating whether the
specific epithet was successfully matched within the matched genus
(\`TRUE\`) or not (\`FALSE\`).
