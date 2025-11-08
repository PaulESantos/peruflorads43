# Get Threatened Species Database

Retrieves the threatened plant species database for Peru. This function
provides controlled access to the internal datasets used by the package.

## Usage

``` r
get_threatened_database(type = c("original", "updated"))
```

## Arguments

- type:

  Character string specifying which database version to retrieve.
  Options are:

  - `"original"` (default): Original nomenclature from DS 043-2006-AG
    (2006)

  - `"updated"`: Updated nomenclature with current taxonomic consensus

## Value

A tibble containing the threatened species database.

## Note

This function is primarily for advanced users who need direct access to
the database structure. For most use cases, use the higher-level
functions:
[`is_threatened_peru`](https://paulesantos.github.io/peruflorads43/reference/is_threatened_peru.md)
or
[`is_ds043_2006_ag`](https://paulesantos.github.io/peruflorads43/reference/is_ds043_2006_ag.md).

## Database Structure

\*\*Original Database\*\* (`type = "original"`):

- ~777 species as listed in DS 043-2006-AG

- Supports quaternomial names (Rank 4)

- Includes both accepted names and synonyms

- Columns: scientific_name, genus, species, tag, infraspecies, tag_2,
  infraspecies_2, threat_category, accepted_name_author,
  taxonomic_status, accepted_name, family, protected_ds_043

\*\*Updated Database\*\* (`type = "updated"`):

- Updated nomenclature using WCVP and POWO

- Supports trinomial names (Rank 3 maximum)

- Only accepted names (synonyms resolved)

- Columns: scientific_name, genus, species, tag_acc, infraspecies,
  threat_category, accepted_name_author, taxonomic_status,
  accepted_name, family, protected_ds_043

## Threat Categories

- CR:

  Critically Endangered

- EN:

  Endangered

- VU:

  Vulnerable

- NT:

  Near Threatened

## Legal Context

Data based on Supreme Decree DS 043-2006-AG, Ministry of Agriculture,
Peru (July 13, 2006), which establishes the official list of threatened
wild flora species in Peru.

## See also

[`is_threatened_peru`](https://paulesantos.github.io/peruflorads43/reference/is_threatened_peru.md)
to check threat status of species
[`is_ds043_2006_ag`](https://paulesantos.github.io/peruflorads43/reference/is_ds043_2006_ag.md)
to check DS 043 protection status

## Examples

``` r
# \donttest{
# Get original database
db_original <- get_threatened_database(type = "original")
str(db_original)
#> tibble [776 × 13] (S3: tbl_df/tbl/data.frame)
#>  $ scientific_name     : chr [1:776] "Aphelandra cuscoensis" "Aphelandra formosa" "Aphelandra wurdackii" "Tetramerium sagasteguianum" ...
#>  $ author              : chr [1:776] "Wasshausen" "(Humboldt & Bonpland) Ness" "Wassh" "T.F Daniel" ...
#>  $ family              : chr [1:776] "Acanthaceae" "Acanthaceae" "Acanthaceae" "Acanthaceae" ...
#>  $ tag                 : chr [1:776] NA NA NA NA ...
#>  $ infraspecies_2      : chr [1:776] NA NA NA NA ...
#>  $ accepted_name       : chr [1:776] "Aphelandra cuscoensis" "Aphelandra formosa" "Aphelandra wurdackii" "Tetramerium sagasteguianum" ...
#>  $ accepted_name_author: chr [1:776] "Wassh." "(Bonpl.) Nees" "Wassh." "T.F.Daniel" ...
#>  $ accepted_family     : chr [1:776] "Acanthaceae" "Acanthaceae" "Acanthaceae" "Acanthaceae" ...
#>  $ taxonomic_status    : chr [1:776] "Accepted" "Accepted" "Accepted" "Accepted" ...
#>  $ threat_category     : chr [1:776] "CR" "CR" "CR" "CR" ...
#>  $ genus               : chr [1:776] "APHELANDRA" "APHELANDRA" "APHELANDRA" "TETRAMERIUM" ...
#>  $ species             : chr [1:776] "CUSCOENSIS" "FORMOSA" "WURDACKII" "SAGASTEGUIANUM" ...
#>  $ infraspecies        : chr [1:776] NA NA NA NA ...
nrow(db_original)
#> [1] 776

# Get updated database
db_updated <- get_threatened_database(type = "updated")
str(db_updated)
#> tibble [179 × 12] (S3: tbl_df/tbl/data.frame)
#>  $ scientific_name     : chr [1:179] "Pucara leucantha" "Ceroxylon weberbaueri" "Dyssodia lopez-mirandae" "Senecio mollendoensis" ...
#>  $ author              : chr [1:179] "Ravenna" "Burret" "Cabrera" "Cabrera" ...
#>  $ family              : chr [1:179] "Amaryllidaceae" "Arecaceae" "Asteraceae" "Asteraceae" ...
#>  $ accepted_name       : chr [1:179] "Stenomesson leucanthum" "Ceroxylon pityrophyllum" "Schizotrichia lopez-mirandae" "Lomanthus mollendoensis" ...
#>  $ accepted_name_author: chr [1:179] "(Ravenna) Meerow & van der Werff" "(Mart.) Mart. ex H.Wendl." "(Cabrera) Molinari" "(Cabrera) B.Nord." ...
#>  $ accepted_family     : chr [1:179] "Amaryllidaceae" "Arecaceae" "Asteraceae" "Asteraceae" ...
#>  $ taxonomic_status    : chr [1:179] "Synonym" "Synonym" "Synonym" "Synonym" ...
#>  $ threat_category     : chr [1:179] "CR" "CR" "CR" "CR" ...
#>  $ genus               : chr [1:179] "STENOMESSON" "CEROXYLON" "SCHIZOTRICHIA" "LOMANTHUS" ...
#>  $ species             : chr [1:179] "LEUCANTHUM" "PITYROPHYLLUM" "LOPEZ-MIRANDAE" "MOLLENDOENSIS" ...
#>  $ tag_acc             : chr [1:179] NA NA NA NA ...
#>  $ infraspecies        : chr [1:179] NA NA NA NA ...

# Compare number of species
n_original <- nrow(db_original)
n_updated <- nrow(db_updated)
cat("Original:", n_original, "| Updated:", n_updated, "\n")
#> Original: 776 | Updated: 179 

# Count by threat category
table(db_original$threat_category)
#> 
#>  CR  EN  NT  VU 
#> 193  73 119 391 

# Find critically endangered orchids
orchids <- db_original[db_original$family == "ORCHIDACEAE" &
                       db_original$threat_category == "CR", ]
head(orchids$scientific_name)
#> character(0)
# }
```
