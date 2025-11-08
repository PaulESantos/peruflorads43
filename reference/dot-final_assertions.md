# Final Validation of Matching Results

Validates that the output maintains integrity with the original input,
including proper handling of duplicate names.

## Usage

``` r
.final_assertions(splist_class, output_f)
```

## Arguments

- splist_class:

  Tibble. Original classified species list

- output_f:

  Tibble. Final formatted output

## Value

Invisible TRUE if all checks pass, otherwise throws error
