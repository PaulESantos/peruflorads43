# Fuzzy Match Species within Genus

This function attempts to fuzzy match species names within a genus to
the threatened species database using fuzzyjoin::stringdist for fuzzy
matching.

## Usage

``` r
fuzzy_match_species_within_genus(df, target_df = NULL)
```

## Arguments

- df:

  A tibble containing the species data to be matched.

- target_df:

  A tibble representing the threatened species database containing the
  reference list of threatened species.

## Value

A tibble with an additional logical column
fuzzy_match_species_within_genus, indicating whether the specific
epithet was successfully fuzzy matched within the matched genus
(\`TRUE\`) or not (\`FALSE\`).

## Details

If multiple species match with the same string distance (ambiguous
matches), a warning is issued and the first match is automatically
selected. To examine ambiguous matches in detail, use
[`get_ambiguous_matches`](https://paulesantos.github.io/peruflorads43/reference/get_ambiguous_matches.md)
on the result object with `type = "species"`.

\*\*IMPROVED\*\*: Ambiguous match attributes now include threat category
and accepted names for better decision-making.

## See also

[`get_ambiguous_matches`](https://paulesantos.github.io/peruflorads43/reference/get_ambiguous_matches.md)
to retrieve ambiguous match details
