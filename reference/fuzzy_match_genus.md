# Fuzzy Match Genus Name

This function performs a fuzzy match of genus names against the
threatened species database using fuzzyjoin::stringdist() to account for
slight variations in spelling.

## Usage

``` r
fuzzy_match_genus(df, target_df = NULL)
```

## Arguments

- df:

  A tibble containing the genus names to be matched.

- target_df:

  A tibble representing the threatened species database containing the
  reference list of threatened species.

## Value

A tibble with two additional columns: - fuzzy_match_genus: A logical
column indicating whether the genus was successfully matched (\`TRUE\`)
or not (\`FALSE\`). - fuzzy_genus_dist: A numeric column representing
the distance for each match.

## Details

If multiple genera match with the same string distance (ambiguous
matches), a warning is issued and the first match is automatically
selected. To examine ambiguous matches in detail, use
[`get_ambiguous_matches`](https://paulesantos.github.io/peruflorads43/reference/get_ambiguous_matches.md)
on the result object.

\*\*IMPROVED\*\*: Ambiguous match attributes now include database
information such as family and representative species for better manual
curation.

## See also

[`get_ambiguous_matches`](https://paulesantos.github.io/peruflorads43/reference/get_ambiguous_matches.md)
to retrieve ambiguous match details
