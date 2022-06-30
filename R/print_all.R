#' Print all rows
#'
#' Wraps the `print()` function with `n = Inf`
#'
#' @param x is the object to print
#'
#' @return prints its argument and returns it _invisibly_.
#' @export
#' @examples
#' print_all(x, ...)
print_all <- function(x, ...) {
  print(x, n = Inf, ...)
}
