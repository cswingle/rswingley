#' Rename geometry column
#'
#' Rename the geometry column in an sf object
#'
#' Function code from Spacedman in this thread:·https://gis.stackexchange.com/questions/386589
#'
#' @param g spatial data frame containing an sf geometry
#' @param name updated geometry name
#'
#' @return spatial data frame with the geometry column renamed
#' @export
#' @examples
#' library(sf)
#' df <- data.frame(name = "ABR", lat = 64.912, lon = -147.932)
#' df <- st_as_sf(df, coords = c("lon", "lat"), crs = 4326)
#' df <- rename_geometry(df, "the_geom")
rename_geometry <- function(g, name) {
  current <- attr(g, "sf_column")
  names(g)[names(g) == current] <- name
  sf::st_geometry(g) <- name
  g
}
