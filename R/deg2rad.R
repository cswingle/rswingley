#' Convert degrees to radians
#'
#' @param deg is the angle in degrees
#'
#' @return returns the angle in radians
#' @export
#' @examples
#' rad2deg(3.1415)
deg2rad <- function(rad) {
  return(deg * (pi / 180))
}
