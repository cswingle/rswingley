#' Unique values string aggregate
#'
#' String aggregate that only includes unique values.
#'
#' @param x character vector to aggregate
#' @param collapse string placed between elements in aggregate
#'
#' @return character value with all unique items included, separated by the value of the collapse parameter.
#' @export
#' @examples
#' x <- c("a", "a", "b", "c", "d", "d")
#' unique_str_agg(x, ",")
unique_str_agg <- function(x, collapse = ",") {
    paste(unique(x[!is.na(x)]), collapse = collapse)
}
