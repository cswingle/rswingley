% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print_all.R
\name{print_all}
\alias{print_all}
\title{Print all rows}
\usage{
print_all(x, ...)
}
\arguments{
\item{x}{is the object to print}

\item{...}{arguments passed to `print()`}
}
\value{
prints its argument and returns it _invisibly_.
}
\description{
Wraps the `print()` function with `n = Inf` (which means it only works with
tibbles).
}
\examples{
print_all(tibble::as_tibble(mtcars))
}
