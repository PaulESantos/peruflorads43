# Suffix Match Species within Genus

Function to match the specific epithet by exchanging common suffixes
within an already matched genus in the threatened species database.

## Usage

``` r
suffix_match_species_within_genus_helper(df, target_df)
```

## Arguments

- df:

  A tibble.

- target_df:

  A tibble representing the threatened species database containing the
  reference list of threatened species.

## Value

Returns a tibble with the additional logical column
suffix_match_species_within_genus, indicating whether the specific
epithet was successfully matched within the matched genus (\`TRUE\`) or
not (\`FALSE\`).
