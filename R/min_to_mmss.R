#' Convert minutes to MM:SS.s string
#'
#' Convert minutes into a zero padded string formatted as MM:SS.s.
#'
#' @param minutes numeric for the minutes to format
#'
#' @return character string formatted as MM:SS.s
#' @export
#' @examples
#' min_to_mmss(9.56)
min_to_mmss <- function(minutes) {
    mm = floor(minutes)
    seconds = (minutes - mm) * 60

    paste(sprintf("%02d", mm), sprintf("%04.1f", seconds),
          sep = ":")
}
