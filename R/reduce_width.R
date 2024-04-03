#' Reduces the option "width" by two
#'
#' Reduces the width by two from the current width
#'
#' @export
#' @examples
#' getOption("width")
#' reduce_width()
#' getOption("width")
reduce_width <- function() {
  options(width = getOption("width") - 2)
}
