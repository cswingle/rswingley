#' Convert minutes to HH:MM:SS.s string
#'
#' Convert minutes into a zero padded string formatted as HH:MM:SS.s.
#'
#' @param minutes numeric for the minutes to format
#'
#' @return character string formatted as HH:MM:SS.s
#' @export
#' @examples
#' min_to_hhmmss(139.56)
min_to_hhmmss <- function(minutes) {
    hh = floor(minutes / 60.0)
    min = minutes - (hh * 60)
    mm = floor(min)
    seconds = (min - mm) * 60

    paste(sprintf("%02d", hh), sprintf("%02d", mm), sprintf("%04.1f", seconds),
          sep = ":")
}
