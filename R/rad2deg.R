#' Convert radians to degrees
#'
#' @param rad is the angle in radians
#'
#' @return returns the angle in degrees
#' @export
#' @examples
#' rad2deg(3.1415)
rad2deg <- function(rad) {
  return(rad * (180 / pi))
}
