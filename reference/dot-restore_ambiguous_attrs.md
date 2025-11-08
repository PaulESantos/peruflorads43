# Restore Ambiguous Match Attributes

Attaches previously backed-up ambiguous match attributes to a tibble.

## Usage

``` r
.restore_ambiguous_attrs(tbl, backup)
```

## Arguments

- tbl:

  A tibble to which attributes should be attached

- backup:

  A named list of ambiguous match attributes (output from
  \`.backup_ambiguous_attrs()\`)

## Value

The input tibble with ambiguous match attributes attached
