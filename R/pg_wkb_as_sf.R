#' Convert a data frame with a PostGIS WKB column to a sf object.
#'
#' @param x data frame containing a PostGIS WKB column
#' @param geometry name of the geometry column
#'
#' @return sf object
#' @export
#' @examples
#' \dontrun{
#' library(RPostgres)
#' library(sf)
#' con <- dbConnect(
#'   Postgres(),
#'   host = "localhost",
#'   dbname = "gis_db"
#' )
#' df <- con |>
#'   tbl("gis_data") |>
#'   collect()
#' sf_df <- df |>
#'   pg_wkb_as_sf("the_geom")
#' }
pg_wkb_as_sf <- function(x, geometry) {
  stopifnot(inherits(x, "data.frame"))
  dplyr::bind_cols(
    x,
    wkb_geometry = sf::st_as_sfc(x[[geometry]], EKWT = TRUE)
  ) |>
    dplyr::select(-dplyr::any_of(geometry)) |>
    sf::st_as_sf()
}
