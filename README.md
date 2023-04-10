
<!-- README.md is generated from README.Rmd. Please edit that file -->

# peruflorads43

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/peruflorads43)](https://CRAN.R-project.org/package=peruflorads43)
<!-- badges: end -->

The goal of `peruflorads43` is provide users with a convenient way to
access and analyze information on endangered plant species in Peru. The
package could include functions for species name matching.

## Installation

You can install the development version of `peruflorads43` like so:

``` r
pak::pak("PaulEsantos/peruflorads43")
```

### Errores ortograficos

``` r
especies_error_ortografico <- tibble::tribble(
               ~especies_raw,             ~tnrs_especies,
     "Ascidiogine wurdackii",    "Ascidiogyne wurdackii",
  "Proboscidea altheaefolia", "Proboscidea althaeifolia",
         "Jaltomata mioneii",         "Jaltomata mionei",
         "Larnax macrocalix",        "Larnax macrocalyx",
         "Larnax sagastegui",       "Larnax sagasteguii",
       "Solanum chuquidenum",      "Solanum chiquidenum",
          "Mutisia wurdacki",        "Mutisia wurdackii",
        "Peltogyne altisima",      "Peltogyne altissima",
     "Solanum huancabambese",   "Solanum huancabambense",
      "Salvia opossitiflora",     "Salvia oppositiflora",
           "Ligeophila spp.",               "Ligeophila",
     "Masdevallia zebraceae",     "Masdevallia zebracea",
         "Telipogon alegria",       "Telipogon alegriae",
        "Aspasia psitticina",       "Aspasia psittacina",
     "Gongora quinquinervis",    "Gongora quinquenervis",
   "Maxillaria rotumdilabia",  "Maxillaria rotundilabia",
        "Mormodes revolutum",        "Mormodes revoluta",
        "Mormodes rolfeanum",        "Mormodes rolfeana",
       "Trichopilia fragans",     "Trichopilia fragrans",
     "Trichopilia juninense",   "Trichopilia juninensis"
  )
```

### Especies repetidas

``` r
tab_2 <- tibble::tribble(
   ~especies_raw,                                   ~tnrs_especies,                                 ~categoria,
  "Bishopanthus soliceps"                         , "Bishopanthus soliceps"                       , "EN PELIGRO CRITICO (CR)",
  "Bishopanthus soliceps"                         , "Bishopanthus soliceps"                       , "EN PELIGRO CRITICO (CR)",
  "Ceroxylon crispum"                             , "Ceroxylon vogelianum"                        , "VULNERABLE (Vu)",
  "Ceroxylum verriculosum"                        , "Ceroxylon vogelianum"                        , "CASI AMENAZADO (NT)",
  "Comparettia coccinea"                          , "Comparettia coccinea"                        , "VULNERABLE (Vu)",
  "Comparettia peruviana"                         , "Comparettia coccinea"                        , "VULNERABLE (Vu)",
  "Geonoma weberbaueri"                           , "Geonoma undata"                              , "VULNERABLE (Vu)",
  "Geonoma undata"                                , "Geonoma undata"                              , "CASI AMENAZADO (NT)",
  "Haageocereus acranthus subsp. olowinskianus"   , "Haageocereus acranthus subsp. olowinskianus" , "EN PELIGRO CRITICO (CR)",
  "Haageocereus acranthus subsp. olowinskianus"   , "Haageocereus acranthus subsp. olowinskianus" , "EN PELIGRO CRITICO (CR)",
  "Haageocereus acranthus subsp. olowinskianus"   , "Haageocereus acranthus subsp. olowinskianus" , "EN PELIGRO CRITICO (CR)",
  "Haageocereus acranthus subsp. olowinskianus"   , "Haageocereus acranthus subsp. olowinskianus" , "VULNERABLE (Vu)",
  "Haageocereus pseudomelanostele subsp. setosus" , "Haageocereus multangularis"                  , "EN PELIGRO CRITICO (CR)",
  "Haageocereus pseudomelanostele subsp. setosus" , "Haageocereus multangularis"                  , "EN PELIGRO CRITICO (CR)",
  "Lycaste ciliata"                               , "Lycaste ciliata"                             , "VULNERABLE (Vu)",
  "Lycaste fimbriata"                             , "Lycaste ciliata"                             , "VULNERABLE (Vu)",
  "Mila caespitosa subsp. caespitosa"             , "Mila caespitosa"                             , "EN PELIGRO (EN)",
  "Mila caespitosa subsp. densiseta"              , "Mila caespitosa"                             , "EN PELIGRO (EN)"
  )
```
