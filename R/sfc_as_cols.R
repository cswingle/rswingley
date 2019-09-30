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
#' library(sf)
#' df <- data.frame(name = "ABR", lat = 64.912, lon = -147.932)
#' df <- st_as_sf(df, coords = c("lon", "lat"), crs = 4326)
#' df <- sfc_as_cols(df, c("lon_wgs84", "lat_wgs84"))
sfc_as_cols <- function(x, names = c("x", "y")) {
    stopifnot(inherits(x, "sf") && inherits(sf::st_geometry(x), "sfc_POINT"))
    ret <- sf::st_coordinates(x)
    ret <- tibble::as_tibble(ret)
    stopifnot(length(names) == ncol(ret))
    x <- x[ , !names(x) %in% names]
    ret <- stats::setNames(ret, names)
    dplyr::bind_cols(x, ret)
}
