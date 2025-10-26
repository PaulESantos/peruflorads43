library(tidyverse)
library(tabulapdf)
?tabulapdf::extract_tables()
# simple demo file
f <- system.file("examples", "mtcars.pdf", package = "tabulapdf")

# extract tables from only second page
extract_tables(f, pages = 2)
tablas <- extract_tables("ds_043_2016_250712_205717.pdf")

length(tablas)
tab_1 <- tablas[[1]] |>
  janitor::clean_names() |>
  dplyr::select(-x4) |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))


tab_2 <- tablas[[2]] |>
  janitor::clean_names() |>
  dplyr::select(-x4) |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_3 <- tablas[[3]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia_especie = stringr::str_remove(
    familia_especie, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::select(-x2) |>
  dplyr::mutate(familia = stringr::str_extract(familia_especie,
                                               "[A-Z]{1,}"),
                .before = familia_especie
                ) |>
  dplyr::rename(especie = familia_especie) |>
  dplyr::mutate(especie = stringr::str_remove(especie,
                                              familia) |>
                  stringr::str_squish()) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_4 <- tablas[[4]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))


tab_5 <- tablas[[5]] |>
  janitor::clean_names() |>
  dplyr::select(-nombre_comun) |>
  dplyr::rename(nombre_comun = x3) |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))


tab_6 <- tablas[[6]] |>
  janitor::clean_names() |>
  dplyr::select(-nombre_comun) |>
  dplyr::rename(nombre_comun = x3) |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_7 <- tablas[[7]] |>
  janitor::clean_names() |>
  dplyr::select(-c(especie, nombre_comun)) |>
  dplyr::rename(especie = x2,
                nombre_comun = x4) |>
  plyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))


tab_8 <- tablas[[8]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_9 <- tablas[[9]] |>
  janitor::clean_names() |>
  dplyr::select(-especie) |>
  dplyr::rename(especie = x2) |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))



tab_10 <- tablas[[10]] |> #pesa::check_na()
  janitor::clean_names() |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::select(-c(x3, especie, nombre_comun)) |>
  dplyr::rename(nombre_comun = x4) |>
  dplyr::mutate(familia_ = stringr::str_extract(familia,
                                               "[A-Z]{1,}"),
                .before = familia
  ) |>
  dplyr::rename(especie = familia,
                familia = familia_) |>
  dplyr::mutate(especie = stringr::str_remove(especie,
                                              familia) |>
                  stringr::str_squish()) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_11 <- tablas[[11]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_12 <- tablas[[12]]  |>
  janitor::clean_names() |>
  dplyr::select(-nombre_comun) |>
  dplyr::rename(nombre_comun = x3) |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))


tab_13 <- tablas[[13]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::select(-c(x3, especie, nombre_comun)) |>
  dplyr::rename(nombre_comun = x4) |>
  dplyr::mutate(familia_ = stringr::str_extract(familia,
                                                "[A-Z]{1,}"),
                .before = familia
  ) |>
  dplyr::rename(especie = familia,
                familia = familia_)  |>
  dplyr::mutate(especie = stringr::str_remove(especie,
                                              familia) |>
                  stringr::str_squish()) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))



tab_14 <- tablas[[14]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::select(-c(x1, x4, x6, x7)) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_15 <- tablas[[15]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::select(-c(x2, x4, x6)) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_16 <- tablas[[16]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia_especie = stringr::str_remove(
    familia_especie, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::select(-x2) |>
  dplyr::mutate(familia = stringr::str_extract(familia_especie,
                                               "[A-Z]{1,}"),
                .before = familia_especie
  ) |>
  dplyr::rename(especie = familia_especie) |>
  dplyr::mutate(especie = stringr::str_remove(especie,
                                              familia) |>
                  stringr::str_squish()) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_17 <- tablas[[17]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia_especie = stringr::str_remove(
    familia_especie, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::select(-x2) |>
  dplyr::mutate(familia = stringr::str_extract(familia_especie,
                                               "[A-Z]{1,}"),
                .before = familia_especie
  ) |>
  dplyr::rename(especie = familia_especie) |>
  dplyr::mutate(especie = stringr::str_remove(especie,
                                              familia) |>
                  stringr::str_squish()) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_18 <- tablas[[18]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia_especie = stringr::str_remove(
    familia_especie, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::select(-x2) |>
  dplyr::mutate(familia = stringr::str_extract(familia_especie,
                                               "[A-Z]{1,}"),
                .before = familia_especie
  ) |>
  dplyr::rename(especie = familia_especie) |>
  dplyr::mutate(especie = stringr::str_remove(especie,
                                              familia) |>
                  stringr::str_squish()) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_19 <- tablas[[19]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))

tab_20 <- tablas[[20]] |>
  janitor::clean_names() |>
  dplyr::mutate(familia = stringr::str_remove(
    familia, "[0-9]{1,}\\."
  ) |>  stringr::str_squish()
  ) |>
  dplyr::select(-c(x3, especie, nombre_comun)) |>
  dplyr::rename(nombre_comun = x4) |>
  dplyr::mutate(familia_ = stringr::str_extract(familia,
                                                "[A-Z]{1,}"),
                .before = familia
  ) |>
  dplyr::rename(especie = familia,
                familia = familia_)  |>
  dplyr::mutate(especie = stringr::str_remove(especie,
                                              familia) |>
                  stringr::str_squish()) |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1))


dplyr::bind_rows(tab_1, tab_2, tab_3, tab_4, tab_5,
                 tab_6, tab_7, tab_8, tab_9, tab_10,
                 tab_11, tab_12, tab_13, tab_14, tab_15,
                 tab_16, tab_17, tab_18, tab_19, tab_20 ) |>
  writexl::write_xlsx("peru_ds_043_2006_agricultura_.xlsx")


# ---------------------------------------------------------------


plantas <- tibble::tibble(
  familia = c(
    "ARECACEAE", "BEGONIACEAE", "BEGONIACEAE", "BIGNONACEAE", "BIXACEAE",
    "BORAGINACEAE", "BROMELIACEAE", "BROMELIACEAE", "BROMELIACEAE", "BUXACEAE",
    "BUXACEAE", "FABACEAE", "FABACEAE", "GERANIACEAE", "GERANIACEAE",
    "KRAMERIACEAE", "MALVACEAE", "MALVACEAE", "MALVACEAE", "MALVACEAE",
    "MALVACEAE", "MALVACEAE"
  ),
  especie = c(
    "Manicaria saccifera Gaertn.",
    "Begonia octopetala subsp. ovatoformis Irmscher",
    "Begonia veitchii Hooker.f.",
    "Tabebuia impetiginosa (Mart. ex DC.) Standl.",
    "Cochlospermum vitifolium (Willd.) Spreng.",
    "Tiquilia ferreyrae (I. M. Johnston) A. Richardson.",
    "Puya raimondii Harms",
    "Tillandsia sagasteguii L.B. Sm.",
    "Tillandsia werdermannii Harms",
    "Styloceras columnare Muell.Arg.",
    "Styloceras laurifolium (Willd.) Kunth",
    "Prosopis chilensis (Molina) Stuntz",
    "Prosopis juliflora (Sw.) DC.",
    "Geranium ayavacense Willd. Ex Kunth",
    "Geranium dielsianum Knuth",
    "Krameria lappacea (Dombey) Burdet & B.B. Simpson",
    "Abutilon arequipense Ulbrich",
    "Abutilon peruvianum (Lam.) Kearney",
    "Acaulimalva alismatiofolia (Schumann & Hieronymus) Krapovickas",
    "Acaulimalva sulphurea Krapov.",
    "Cienfuegosia hitchcockii (Ulbr.) O.J. Blanch.",
    "Gaya atiquipana Krapov."
  ),
  nombre_comun = c(
    "yarinilla",
    "achanqaray, begonia",
    "achanqaray, begonia",
    "guayacán",
    "Polo-polo",
    "Flor de arena",
    "ckara, cunco, junco, llacuash, santón, tica-tica, titanca, q'ayara",
    "",
    "",
    "Limoncillo",
    "curape, limoncito de cachos, naranjillo, sapanque",
    "Algarrobo, huarango, tacco",
    "Algarrobo, huarango",
    "",
    "pasuchaca, pasochaca",
    "antacushma, mapato, malapato, ractania, rataña, ratania, sanyo, chuquitanga",
    "",
    "",
    "",
    "",
    "",
    ""
  )
)
plantas |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1)) |>
  writexl::write_xlsx("peru_ds_043_2006_agricultura_1.xlsx")


# ---------------------------------------------------------------

orquideas_nt <- tibble::tibble(
  familia = rep("ORCHIDACEAE", 26),
  especie = c(
    "Bletia mandonii Schlecter",
    "Brassia koehlerorum Schltr.",
    "Brassia thyrsodes Reichenbach f.",
    "Bulbophyllum meridense Reichenbach f.",
    "Catasetum tuberculatum Dodson",
    "Chaubardia surinamensis Reichenbach f.",
    "Cycnoches quatuorcristis D.Bennett",
    "Cyrtopodium cristatum Lindley",
    "Draconanthes aberrans (Schltr.) Luer",
    "Dryadella simula (Reichenbach f.) Luer",
    "Encyclia randii (Barb.Rodr.) Porto & Brade",
    "Epidendrum ciliare L.",
    "Galeandra stangeana Reichb.F.",
    "Gongora gracilis Jenny",
    "Gongora nigropunctata Schltr.",
    "Gongora scaphephorus Reichenbach f. & Warscewicz",
    "Habenaria sartor Lindley",
    "Helcia sanguinolenta Lindley",
    "Hexisea imbricata (Lindley) Reichenbach f.",
    "Kefersteinia pusilla (C. Schweinf.) C. Schweinf.",
    "Lepanthes minutipetala C. Schweinfurth",
    "Masdevallia agaster Luer",
    "Myrosmodes nubigenum Reichenbach f.",
    "Myrosmodes paludosum (Reichenbach f.) Garay",
    "Phragmipedium boissierianum (Rchb. F.)Rolfe",
    "Phragmipedium caricinum (Lindl. & Paxton) Rolfe"
  ),
  nombre_comun = c(
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "sachagolondrina",
    "",
    "",
    "",
    "avispa",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "zapatito del rey",
    "zapatito del niño"
  )
)

# Mostrar el tibble
orquideas_nt |>
  dplyr::mutate(genero = stringr::word(especie, 1, 1),
                epitheto = stringr::word(especie, 2, 2),
                autor = stringr::word(especie, 3, -1)) |>
  writexl::write_xlsx("peru_ds_043_2006_agricultura_2.xlsx")



