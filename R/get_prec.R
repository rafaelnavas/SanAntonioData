#' @title
#' Get precipitation from raingauge at a given timestep and period
#'
#' @description
#' Función para obtener la serie temporal de precipitación para una duración dada"
#'
#' @param raingauge Character string that provides the code of the raingauge (i.e. "P01").
#' @param timestep Character string that provides the cumulative interval for precipitation depth. Can be “min”, “hour”, “day”, “DSTday”, “week”, “month”, “quarter” or “year”. (i.e. "10 min")
#' @param ini.date Object of class "POSIXlt with the start date
#' @param end.date Object of class "POSIXlt with the end date
#'
#' @return Tibble with two columns: date, and precipitation (mm)
#'
#' @examples
#' get_prec(raingauge = "P01",
#'          timestep = "5 min",
#'          ini.date = strptime("2017-03-22 00:00:00", "%Y-%m-%d %H:%M:%S"),
#'          end.date = strptime("2017-03-23 00:00:00", "%Y-%m-%d %H:%M:%S"))

get_prec <- function(raingauge,timestep,ini.date,end.date) {
  p = get("P01")
  p = p[p$date>=ini.date & p$date<end.date,]
  p = openair::timeAverage(p,
                           start.date = ini.date,
                           end.date = end.date,
                           avg.time = timestep,
                           fill = FALSE,
                           interval = timestep,
                           statistic = "sum")
  p$p[is.na(p$p)] = 0
  return(p)
}


