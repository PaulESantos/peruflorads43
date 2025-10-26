#' @keywords internal
# perutimber_especies list ------------------------------------------------
#' lista de especies presentes en la base de datos perutimber
#' se debe conciderar que las combinaciones de input_genus, input_epitheton,
#' input_subspecies_epitheton son unicos,
#' los valores de  accepted_name pueden repetirse

 library(tidyverse)

 ds43 <- readxl::read_excel("ds_043_2016.xlsx")

 ds43 |>  names()

 ds43
 ds_43 <- ds43 |>
 mutate(ESPECIE =  case_when(
   is.na(ESPECIE) & !is.na(...2) ~ ...2,
   TRUE ~ ESPECIE
 )) |>
   filter(!if_all(everything(), is.na)) |>
   mutate(categoria =  case_when(
   is.na(ESPECIE) ~ FAMILIA,
   TRUE ~ NA_character_
   )) |>
   tidyr::fill(categoria, .direction = "down") |>
   filter(FAMILIA != "FAMILIA") |>
   mutate(`NOMBRE COMUN` = case_when(
     is.na(`NOMBRE COMUN`) & !is.na(...5) ~ ...5,
     is.na(`NOMBRE COMUN`) & !is.na(...6) ~ ...6,
     TRUE ~ `NOMBRE COMUN`
   )) |>
   select(categoria, FAMILIA, ESPECIE, `NOMBRE COMUN`) |>
   janitor::clean_names() |>
   mutate(familia = str_extract(familia, "[A-Z]{1,}"))

 ds_43 <-
 ds_43  |>
   #select(especie) |>
   mutate(genero = stringr::word(especie, 1),
          specific_epithet = stringr::word(especie, 2)
          )  |>
   mutate(especie =
            str_replace(especie, "var\\.", "var\\. ") |>
            str_trim() |>
            str_squish()) |>
   #filter(str_detect(especie,
   #                  "subsp\\.|var\\.")) |>
   mutate(
     # Extraer el patrón 'subsp.' o 'var.' en una nueva columna 'tag'
     tag = case_when(
       str_detect(especie, "subsp\\.") ~ "subsp.",
       str_detect(especie, "var\\.") ~ "var.",
       TRUE ~ NA_character_
     ),
     # Extraer la palabra que sigue a 'subsp.' o 'var.' y asignarla a 'infraespecie'
     infraespecie = case_when(
       str_detect(especie, "subsp\\.") ~ str_extract(especie, "(?<=subsp\\.\\s)\\w+"),
       str_detect(especie, "var\\.") ~ str_extract(especie, "(?<=var\\.\\s)\\w+"),
       TRUE ~ NA_character_
     )
   ) |>
   rowwise() |>
   mutate(scientific_name =
            case_when(
              is.na(tag) ~ paste(genero,
                                 specific_epithet,
                                 collapse =  " "),
              !is.na(tag) ~ paste(genero,
                                 specific_epithet,
                                 tag,
                                 infraespecie,
                                 collapse =  " ")
            ))
 ds_43 |>  distinct()
 ds_43 |>
   distinct(categoria)

 #writexl::write_xlsx("ds_043_2016_p.xlsx")
 library(tidyverse)



 ds43 <- readxl::read_xlsx("ds_043_2016_p.xlsx")
 ds43

 pspecies <- ds43 |>
   select(scientific_name) |>
   pull(scientific_name) |>
   unique() |>
   str_trim() |>
   str_squish()
 pspecies[1:6]

 ds43$especie

 ds_species <- ds43$scientific_name
 ds_species |>  class()
 pspecies |>  class()

 pspecies |>  length()

 ds43 |>
   count(scientific_name) |>
   filter(n > 1)

 dplyr::setdiff(ds_species, pspecies)
 dplyr::setdiff(pspecies, ds_species)

 ds43 |>
   filter(scientific_name %in% c(
     "Bishopanthus soliceps",
     "Haageocereus acranthus subsp. olowinskianus",
     "Haageocereus pseudomelanostele subsp. setosus"
   )) |>
   select(id, categoria, especie, scientific_name, familia) |>
   arrange(especie) |>
   select(1:3)
 # ---------------------------------------------------------------
 library(tidyverse)
 library(TNRS)
 dstnrs <- TNRS::TNRS(pspecies,
                      sources = "wcvp"
                      )
 ?TNRS()
 names(dstnrs)
 dstnrs2 <- tibble::as_tibble(dstnrs) |>
   dplyr::select(Name_submitted, Name_matched,
                 Accepted_name,
                 Accepted_family, Accepted_name_author,
                 Accepted_name_rank, Taxonomic_status,
                 Overall_score) |>
   select(scientific_name = Name_submitted, everything())

 ds43_tnrs <- ds43 |>
   left_join(dstnrs2)|>
   add_count(Accepted_name, name = "count_new_names") |>
   mutate(
     # Extraer la abreviación (contenido entre paréntesis)
     categoria_id = str_extract(categoria, "\\((.*?)\\)") |>
       str_remove_all("[\\(\\)]") |>
       str_to_upper(),

     # Eliminar el contenido entre paréntesis y aplicar formato título
     categoria = str_replace(categoria, "\\s*\\((.*?)\\)", "") |>
       str_to_title() |>
       str_trim()
   )

 ds43_tnrs |>
   writexl::write_xlsx("ds43_tnrs_2024.xlsx")


 ds43_tnrs <- readxl::read_excel("ds43_tnrs_2024.xlsx")
 ds43_tnrs
 select(categoria) |>
   distinct() |>
   mutate(
     # Extraer la abreviación (contenido entre paréntesis)
     categoria_id = str_extract(categoria, "\\((.*?)\\)") |>
       str_remove_all("[\\(\\)]") |>
       str_to_upper(),

     # Eliminar el contenido entre paréntesis y aplicar formato título
     categoria = str_replace(categoria, "\\s*\\((.*?)\\)", "") |>
       str_to_title() |>
       str_trim()
   )

 # ---------------------------------------------------------------
 dstnrs |>
   filter(Name_submitted == "Ceroxylum verriculosum")

   filter(is.na(ESPECIE))

 ds43 |>
   filter(fuente == "adiciones")

 ds_df <- ds43 |>
 dplyr::mutate(id_cat = paste0( dplyr::row_number(),
                               stringr::str_sub(input_genus, 1, 2),
                               stringr::str_sub(input_epitheton, 1, 2)) |>
                    toupper()) |>
 dplyr::mutate_all(~stringr::str_trim(.) |>  stringr::str_squish()) |>
 dplyr::mutate(especie = dplyr::if_else(is.na(especie),
                                             tnrs_especies,
                                             especie))

 ds_df |>
   dplyr::distinct(fuente)
 ds_df |>
   dplyr::count(fuente)
 ds_df |>  dim()
 # revisa que los nombres completos sean unicos
 ds_df |>
 dplyr::filter(!stringr::str_detect(especie, "forma")) |>
 #dplyr::filter(fuente == "original") |>
 dplyr::add_count(scientific_name) |>
 dplyr::filter(n > 1) |>
 dplyr::distinct(scientific_name, categoria, n, fuente, especie)
 # para tener registros unicos se retiran los registros de las especies que
 # se listan como formas
 library(tidyverse)
 ds_df <- ds_df |>
 dplyr::filter(!stringr::str_detect(especie, "forma")) |>
 dplyr::rename(accepted_family = tnrs_familia,
               rank = accepted_name_rank,
               accepted_name = tnrs_especies)
 ds_df |>
 distinct(fuente)
 # TAB_PERUTIMBER ----------------------------------------------------------
 #' esta base de datos debe ser guardada en una base de datos de tipo
 #' data.frame
 names_tab_ds43 <- c("id_cat", "input_genus", "input_epitheton",
                         "rank", "input_subspecies_epitheton", "taxonomic_status",
                         "accepted_name", "accepted_family",
                         "accepted_name_author")
 names_tab_ds43|> length()
 tab_ds43_2006 <- ds_df |>
 dplyr::select( dplyr::all_of(names_tab_ds43)) |>
 as.data.frame()
 tab_ds43_2006 |>
 pesa::check_na()
 # PERUTIMBER SPS CLASS ----------------------------------------------------
 #' esta debe almacenarce como matrx o array
 names_sps_class <- c("species", "genus", "epithet", "author",
                    "subspecies", "variety",
                    "subvariety", "forma", "subforma", "id")
 ds43_2006_sps_class <-
 ds_df |>
 dplyr::rename(species = scientific_name,
               genus = input_genus,
               epithet = input_epitheton,
               author = accepted_name_author,
               subspecies = subspecie,
               variety = variedad) |>
 dplyr::mutate(subvariety = "",
               forma = "",
               subforma = "",
               id =  dplyr::row_number()) |>
 dplyr::select( dplyr::all_of(names_sps_class)) |>
 dplyr::mutate_all(~as.character(.) |>
                     toupper()) |>
 dplyr::mutate(subspecies  = dplyr::if_else(is.na(subspecies),
                                            "",
                                            subspecies),
               variety  = dplyr::if_else(is.na(variety),
                                            "",
                                            variety)) |>
 as.matrix.data.frame()
 ds43_2006_sps_class |>
 head()
 #class()
 # -------------------------------------------------------------------------
 ds_043_2006_ag <- ds_df |>
  dplyr::select(categoria,
                accepted_name = tnrs_especies,
                accepted_family = tnrs_familia) |>
  dplyr::distinct() |>
  as.data.frame()
 ds_043_2006_ag
 #'
 #'
 #'
 # TAB POSSITION -----------------------------------------------------------
 #' esta debe ser guardada como data.frame
 #' perutimber::tab_perutimber_position
 names_posistion = c("position", "triphthong", "genus")
 tab_ds43_2006_position <- ds_df |>
 dplyr::select(genus = input_genus) |>
 dplyr::mutate(id =  dplyr::row_number(),
               triphthong = stringr::str_sub(genus, 1, 3)) |>
 dplyr::mutate_if(is.character, ~toupper(.)) |>
 dplyr::group_by(genus, triphthong) |>
 dplyr::summarise(position = min(id),
                  .groups = "drop") |>
 dplyr::arrange(position) |>
 as.data.frame() |>
 dplyr::select(dplyr::all_of(names_posistion))
 tab_ds43_2006_position |>  head()
 tab_ds43_2006_position |>  dim()
 # save clean data ---------------------------------------------------------
 tab_ds43_2006 |>
 save(file = "data/tab_ds43_2006.rda")
 ds43_2006_sps_class |>
 save(file = "data/ds43_2006_sps_class.rda")
 tab_ds43_2006_position |>
 save(file = "data/tab_ds43_2006_position.rda")
 ds_043_2006_ag |>
  save(file = "data/ds_043_2006_ag.rda")
