#' find_ds043
#' @description
#' `r lifecycle::badge("maturing")`
#' The function automates the process to check if a plant species is or not endemic to Perú.
#'
#' @param x an atomic character string or a vector with the species names that will be verified if it endemic species
#'
#' @return a vector with information for each species names tested: a) "endemic" if the species is endemic of Perú; b)  "not endemic" if the species is not endemic of Perú; c)"not binary name" if only the genera were submitted; d) "taxon state undefined" if the submitted species name has a taxonomic status undetermined.
#' @export
#' @importFrom rlang .data
#' @importFrom dplyr filter
#' @examples
#' # Basic usage
#' spp <- c("Tetramerium sagasteguianum", "Miconia alpina", "Psychopsis versteegianum")
#' find_ds043(spp)
find_ds043 <- function(x){

  if(is.vector(x) == TRUE){
    ds_043_2006_ag[ds_043_2006_ag$accepted_species %in% x,
                   c(2, 3, 4, 5, 6)]
  }
  else if( class(x) %in% c("tbl_df", "tbl", "data.frame")){
    ds_043_2006_ag |>
      dplyr::filter(accepted_species %in% sp)
  }
}
