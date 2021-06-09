## code to prepare `DATASET` dataset goes here

rm(list = ls())

level_bypass = read.csv("./data-raw/level_bypass.csv",
                  colClasses=c("POSIXct","numeric"))

level_ruta3 = read.csv("./data-raw/level_ruta3.csv",
                  colClasses=c("POSIXct","numeric"))

level_cabecera = read.csv("./data-raw/level_cabecera.csv",
                  colClasses=c("POSIXct","numeric"))

level_chico = read.csv("./data-raw/level_chico.csv",
                  colClasses=c("POSIXct","numeric"))


usethis::use_data(level_bypass, overwrite = TRUE)
usethis::use_data(level_ruta3, overwrite = TRUE)
usethis::use_data(level_cabecera, overwrite = TRUE)
usethis::use_data(level_chico, overwrite = TRUE)
