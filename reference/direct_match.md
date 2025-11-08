# Direct Match Species Names

Performs direct matching of species names against the threatened species
database. Matches binomial names (genus + species), trinomial names (+
infraspecies level 1), and quaternomial names (+ infraspecies level 2)
when applicable.

## Usage

``` r
direct_match(df, target_df = NULL, source = "original")
```

## Arguments

- df:

  A tibble containing the species data to be matched.

- target_df:

  A tibble representing the threatened species database containing the
  reference list of threatened species.

- source:

  Character string specifying which database version to use. Options
  are:

  - `"original"` (default): Uses the original threatened species
    database

  - `"updated"`: Uses the updated database with synonyms

## Value

A tibble with an additional logical column \`direct_match\` indicating
whether the name was successfully matched (\`TRUE\`) or not (\`FALSE\`).
