#' @keywords internal
# perutimber_especies list ------------------------------------------------
#' lista de especies presentes en la base de datos perutimber
#' se debe conciderar que las combinaciones de input_genus, input_epitheton,
#' input_subspecies_epitheton son unicos,
#' los valores de  accepted_name pueden repetirse
#'
# ###comentarios###
# ###comentarios###  ds_df <- readxl::read_xlsx("data/data_ds043_2006.xlsx") |>
# ###comentarios###    dplyr::mutate(id_cat = paste0( dplyr::row_number(),
# ###comentarios###                                   stringr::str_sub(input_genus, 1, 2),
# ###comentarios###                                   stringr::str_sub(input_epitheton, 1, 2)) |>
# ###comentarios###                    toupper()) |>
# ###comentarios###    dplyr::mutate_all(~stringr::str_trim(.) |>  stringr::str_squish())
# ###comentarios###  # revisa que los nombres completos sean unicos
# ###comentarios###  ds_df |>
# ###comentarios###    dplyr::filter(!stringr::str_detect(especie, "forma")) |>
# ###comentarios###    #dplyr::filter(fuente == "original") |>
# ###comentarios###    dplyr::add_count(scientific_name) |>
# ###comentarios###    dplyr::filter(n > 1) |>
# ###comentarios###    dplyr::distinct(scientific_name, categoria, n)
# ###comentarios###  # para tener registros unicos se retiran los registros de las especies que
# ###comentarios###  # se listan como formas
# ###comentarios###  ds_df <- ds_df |>
# ###comentarios###    dplyr::filter(!stringr::str_detect(especie, "forma")) |>
# ###comentarios###    dplyr::rename(accepted_family = tnrs_familia,
# ###comentarios###                  rank = accepted_name_rank,
# ###comentarios###                  accepted_name = tnrs_especies)
# ###comentarios###
# ###comentarios###  ds_df |> names()
# ###comentarios###  # TAB_PERUTIMBER ----------------------------------------------------------
# ###comentarios###  #' esta base de datos debe ser guardada en una base de datos de tipo
# ###comentarios###  #' data.frame
# ###comentarios###  names_tab_ds43 <- c("id_cat", "input_genus", "input_epitheton",
# ###comentarios###                            "rank", "input_subspecies_epitheton", "taxonomic_status",
# ###comentarios###                            "accepted_name", "accepted_family",
# ###comentarios###                            "accepted_name_author")
# ###comentarios###  names_tab_ds43|> length()
# ###comentarios###  tab_ds43_2006 <- ds_df |>
# ###comentarios###    dplyr::select( dplyr::all_of(names_tab_ds43)) |>
# ###comentarios###    as.data.frame()
# ###comentarios###  tab_ds43_2006 |>
# ###comentarios###    pesa::check_na()
# ###comentarios###  # PERUTIMBER SPS CLASS ----------------------------------------------------
# ###comentarios###  #' esta debe almacenarce como matrx o array
# ###comentarios###  names_sps_class <- c("species", "genus", "epithet", "author",
# ###comentarios###                       "subspecies", "variety",
# ###comentarios###                       "subvariety", "forma", "subforma", "id")
# ###comentarios###  ds43_2006_sps_class <-
# ###comentarios###  ds_df |>
# ###comentarios###    dplyr::rename(species = scientific_name,
# ###comentarios###                  genus = input_genus,
# ###comentarios###                  epithet = input_epitheton,
# ###comentarios###                  author = accepted_name_author,
# ###comentarios###                  subspecies = subspecie,
# ###comentarios###                  variety = variedad) |>
# ###comentarios###    dplyr::mutate(subvariety = "",
# ###comentarios###                  forma = "",
# ###comentarios###                  subforma = "",
# ###comentarios###                  id =  dplyr::row_number()) |>
# ###comentarios###    dplyr::select( dplyr::all_of(names_sps_class)) |>
# ###comentarios###    dplyr::mutate_all(~as.character(.) |>
# ###comentarios###                        toupper()) |>
# ###comentarios###    dplyr::mutate(subspecies  = dplyr::if_else(is.na(subspecies),
# ###comentarios###                                               "",
# ###comentarios###                                               subspecies),
# ###comentarios###                  variety  = dplyr::if_else(is.na(variety),
# ###comentarios###                                               "",
# ###comentarios###                                               variety)) |>
# ###comentarios###    as.matrix.data.frame()
# ###comentarios###  ds43_2006_sps_class |>
# ###comentarios###    head()
# ###comentarios###    #class()
# ###comentarios###  # TAB POSSITION -----------------------------------------------------------
# ###comentarios###  #' esta debe ser guardada como data.frame
# ###comentarios###  #' perutimber::tab_perutimber_position
# ###comentarios###  names_posistion = c("position", "triphthong", "genus")
# ###comentarios###  tab_ds43_2006_position <- ds_df |>
# ###comentarios###    dplyr::select(genus = input_genus) |>
# ###comentarios###    dplyr::mutate(id =  dplyr::row_number(),
# ###comentarios###                  triphthong = stringr::str_sub(genus, 1, 3)) |>
# ###comentarios###    dplyr::mutate_if(is.character, ~toupper(.)) |>
# ###comentarios###    dplyr::group_by(genus, triphthong) |>
# ###comentarios###    dplyr::summarise(position = min(id),
# ###comentarios###                     .groups = "drop") |>
# ###comentarios###    dplyr::arrange(position) |>
# ###comentarios###    as.data.frame() |>
# ###comentarios###    dplyr::select(dplyr::all_of(names_posistion))
# ###comentarios###
# ###comentarios###  tab_ds43_2006_position |>  head()
# ###comentarios###  tab_ds43_2006_position |>  dim()
# ###comentarios###  # save clean data ---------------------------------------------------------
# ###comentarios###  tab_ds43_2006 |>
# ###comentarios###    save(file = "data/tab_ds43_2006.rda")
# ###comentarios###  ds43_2006_sps_class |>
# ###comentarios###    save(file = "data/ds43_2006_sps_class.rda")
# ###comentarios###  tab_ds43_2006_position |>
# ###comentarios###    save(file = "data/tab_ds43_2006_position.rda")
