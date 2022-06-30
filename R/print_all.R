#' Print all rows
#'
#' Wraps the `print()` function with `n = Inf`
#'
#' @param x is the object to print
#' @param ... arguments passed to `print()`
#'
#' @return prints its argument and returns it _invisibly_.
#' @export
#' @examples
#' print_all(tibble::as_tibble(mtcars))
print_all <- function(x, ...) {
  print(x, n = Inf, ...)
}
