#' Get grouped count and proportion
#'
#' Similar to `count`, but also includes a `prop` column with the
#' proportion for each group.
#'
#' @param x A data frame, data frame extension (tibble), or a lazy data frame.
#' @param ... Variables to group by.
#' @param sort If ‘TRUE’, will show the largest groups at the top.
#'
#' @return An object of the same type as `.data`
#' @export
#' @examples
#' library(dplyr)
#' starwars |> count_prop(species)
#' @importFrom rlang .data
count_prop <- function(x, ..., sort = FALSE) {
  x |>
    dplyr::count(..., sort = sort) |>
    dplyr::mutate(prop = .data$n / sum(.data$n))
}
