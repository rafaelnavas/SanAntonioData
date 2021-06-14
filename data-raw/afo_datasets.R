## code to prepare `DATASET` dataset goes here

rm(list = ls())

gaugings_bypass = read.csv("./data-raw/afo_ByPass.txt",
                      sep = "\t",
                  colClasses=c("POSIXct","numeric", "numeric"))

gaugings_ruta3 = read.csv("./data-raw/afo_Ruta3.txt",
                      sep = "\t",
                      colClasses=c("POSIXct","numeric", "numeric"))

gaugings_cabecera = read.csv("./data-raw/afo_Cabecera.txt",
                      sep = "\t",
                      colClasses=c("POSIXct","numeric", "numeric"))

gaugings_chico = read.csv("./data-raw/afo_SaChico.txt",
                      sep = "\t",
                      colClasses=c("POSIXct","numeric", "numeric"))


usethis::use_data(gaugings_bypass, overwrite = TRUE)
usethis::use_data(gaugings_ruta3, overwrite = TRUE)
usethis::use_data(gaugings_cabecera, overwrite = TRUE)
usethis::use_data(gaugings_chico, overwrite = TRUE)



# Documentar los datos
usethis::use_r("gaugings_chico")


devtools::document()

usethis::use_package_doc()
usethis::use_tibble()
devtools::document()

devtools::install()


