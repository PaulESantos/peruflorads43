# Backup Ambiguous Match Attributes

Extracts and consolidates ambiguous match attributes from multiple
objects. This prevents attribute loss during dplyr transformations.

## Usage

``` r
.backup_ambiguous_attrs(...)
```

## Arguments

- ...:

  One or more data frames or tibbles that may contain ambiguous match
  attributes

## Value

A named list with consolidated ambiguous match attributes:

- genera:

  Tibble with ambiguous genus matches

- species:

  Tibble with ambiguous species matches

- infraspecies:

  Tibble with ambiguous infraspecies level 1 matches

- infraspecies_2:

  Tibble with ambiguous infraspecies level 2 matches
