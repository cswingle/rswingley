#' Add coordinates as new columns
#'
#' Extract the coordinates from the data frame and create two new columns
#' containing these coordinates.
#'
#' @param x data frame containing an sf point geometry
#' @param names character vector containing the names of the new columns to add
#'
#' @return data frame with the new columns added
#' @export
#' @examples
#' geometry_layer %>% sfc_as_cols(names = c("lon", "lat"))
sfc_as_cols <- function(x, names = c("x", "y")) {
    stopifnot(inherits(x, "sf") && inherits(sf::st_geometry(x), "sfc_POINT"))
    ret <- sf::st_coordinates(x)
    ret <- tibble::as_tibble(ret)
    stopifnot(length(names) == ncol(ret))
    x <- x[ , !names(x) %in% names]
    ret <- setNames(ret, names)
    dplyr::bind_cols(x, ret)
}
