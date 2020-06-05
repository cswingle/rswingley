#' Add utmzone SRID as a new column in data frame
#'
#' Create a new utmzone column containing the EPSG code for the
#' UTM zone the points are within.
#'
#'
#' @param x data frame containing an sf point geometry
#'
#' @return data frame with the utmzone column added
#' @export
#' @examples
#' library(sf)
#' df <- data.frame(name = "ABR", lat = 64.912, lon = -147.932)
#' df <- st_as_sf(df, coords = c("lon", "lat"), crs = 4326)
#' df <- utmzone(df)
#' @importFrom rlang .data
utmzone <- function(x) {
  unproj <- sf::st_transform(x, 4326)
  ret <- sf::st_coordinates(unproj)
  ret <- tibble::as_tibble(ret)
  unproj <- dplyr::bind_cols(unproj, ret)
  unproj <- dplyr::mutate(unproj, prefix = dplyr::if_else(.data$Y > 0, 32600, 32700))
  unproj <- dplyr::mutate(unproj, zone = floor((.data$X + 180) / 6) + 1)
  unproj <- dplyr::mutate(unproj, utmzone = .data$prefix + .data$zone)
  unproj <- dplyr::select(unproj, -c(.data$X, .data$Y, .data$prefix, .data$zone))

  unproj
}
