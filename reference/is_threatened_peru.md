# Check if species are threatened listed in DS 043-2006-AG Peru

This function checks if a list of species names are threatened according
to the Peruvian threatened species database. The function allows fuzzy
matching for species names with a maximum distance threshold to handle
potential typos or variations in species names.

## Usage

``` r
is_threatened_peru(splist, source = "original", return_details = FALSE)
```

## Arguments

- splist:

  A character vector containing the list of species names to be checked
  for threatened status in Peru.

- source:

  Character string specifying which database version to use. Options
  are:

  - `"original"` (default): Uses the original threatened species
    database

  - `"updated"`: Uses the updated database with synonyms

- return_details:

  Logical. If TRUE, returns detailed matching results. If FALSE
  (default), returns only the threat status vector.

## Value

If return_details = FALSE: A character vector indicating the threat
status of each species ("Not threatened", "Threatened - CR",
"Threatened - EN", "Threatened - VU", "Threatened - NT", or
"Threatened - Unknown category").

If return_details = TRUE: A tibble with detailed matching results
including matched names, threat categories, and matching process
information.

## Examples

``` r
# \donttest{
# Example 1: Basic usage with valid species names
species_list <- c("Cattleya maxima", "Polylepis incana", "Fake species")

# Simple status check
threat_status <- tryCatch(
  is_threatened_peru(species_list),
  error = function(e) {
    message("Error in matching: ", e$message)
    rep("Error", length(species_list))
  }
)
print(threat_status)
#> [1] "CR"             "CR"             "Not threatened"

# Example 2: Detailed results
detailed_results <- tryCatch(
  is_threatened_peru(species_list, return_details = TRUE),
  error = function(e) {
    message("Error in detailed matching: ", e$message)
    NULL
  }
)
if (!is.null(detailed_results)) {
  print(detailed_results)
}
#> # A tibble: 3 × 41
#>   Original.Index Orig.Name        sorter Matched.Name     Threat.Status  Author
#>            <int> <chr>             <int> <chr>            <chr>          <chr> 
#> 1              1 Cattleya maxima       1 Cattleya maxima  CR             ""    
#> 2              2 Polylepis incana      2 Polylepis incana CR             ""    
#> 3              3 Fake species          3 ---              Not threatened ""    
#> # ℹ 35 more variables: accepted_name_author <chr>, Matched.Rank <int>,
#> #   Comp.Rank <lgl>, Match.Level <chr>, Orig.Genus <chr>, Orig.Species <chr>,
#> #   Orig.Infraspecies <chr>, Orig.Infraspecies_2 <chr>, Rank <int>,
#> #   Orig.Infra.Rank <chr>, Orig.Infra.Rank_2 <chr>, matched <lgl>,
#> #   direct_match <lgl>, Matched.Genus <chr>, Matched.Species <chr>,
#> #   Matched.Infra.Rank <chr>, Matched.Infraspecies <chr>,
#> #   Matched.Infra.Rank_2 <chr>, Matched.Infraspecies_2 <chr>, …

# Example 3: Handling NA values gracefully
species_with_na <- c("Cattleya maxima", NA, "Polylepis incana")
status_with_na <- is_threatened_peru(species_with_na)
#> 1 species name was empty or NA and will be treated as 'Not threatened'
print(status_with_na)
#> [1] "CR"             "Not threatened" "CR"            

# Example 4: Empty input handling
empty_result <- is_threatened_peru(character(0))
#> Warning: Empty species list provided
print(empty_result)  # Should return character(0)
#> character(0)

# Example 5: Using updated database
updated_results <- tryCatch(
  is_threatened_peru(species_list, source = "updated"),
  error = function(e) {
    message("Error with updated database: ", e$message)
    rep("Error", length(species_list))
  }
)
print(updated_results)
#> [1] "Not threatened" "Not threatened" "Not threatened"
# }
```
