# Get Database Summary Statistics

Provides summary statistics for the threatened species databases.

## Usage

``` r
get_database_summary(type = c("both", "original", "updated"))
```

## Arguments

- type:

  Character string: "original", "updated", or "both" (default).

## Value

A tibble with summary statistics.

## Examples

``` r
# \donttest{
# Get summary of both databases
summary_stats <- get_database_summary()
print(summary_stats)
#> # A tibble: 2 × 10
#>   Database        Total_Species    CR    EN    VU    NT Families Genera
#>   <chr>                   <int> <int> <int> <int> <int>    <int>  <int>
#> 1 Original (2006)           776   193    73   391   119       80    290
#> 2 Updated                   179    44    16    93    26       30     85
#> # ℹ 2 more variables: Has_Infraspecies <int>, Max_Rank <dbl>

# Get summary of just the original
summary_original <- get_database_summary("original")
print(summary_original)
#> # A tibble: 1 × 10
#>   Database Total_Species    CR    EN    VU    NT Families Genera
#>   <chr>            <int> <int> <int> <int> <int>    <int>  <int>
#> 1 original           776   193    73   391   119       80    290
#> # ℹ 2 more variables: Has_Infraspecies <int>, Max_Rank <dbl>
# }
```
