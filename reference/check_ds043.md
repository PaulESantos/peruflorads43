# Simplified wrapper for consolidated matching

Simplified interface for checking DS 043-2006-AG status with automatic
consolidation of original and updated nomenclature.

## Usage

``` r
check_ds043(splist, return_simple = FALSE)
```

## Arguments

- splist:

  Character vector of species names

- return_simple:

  Logical. If TRUE, returns only "Protected" or "Not protected"

## Value

Character vector with protection status

## Examples

``` r
if (FALSE) { # \dontrun{
species <- c("Brassia ocanensis", "Persea americana")
check_ds043(species)
} # }
```
