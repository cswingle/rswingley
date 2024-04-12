#' Find the percentile of an observation in a list of observations.
#'
#' Based on https://github.com/choonghyunryu/dlookr/blob/master/R/utils.R
#'
#' @param value numeric. A scalar value to compare against the observations.
#' @param x numeric. A numeric vector.
#' @param from numeric. Start interval for internal logic.
#' @param to numeric. End interval for internal logic.
#' @param eps numeric. Threshold for calculating approximate value.
#'
#' @return numeric. Percentile position of value between [0, 100].
#'
#' @export
#' @examples
#' x <- runif(100) * 100
#' percentile(25, x)
percentile <- function(value, x, from = 0, to = 1, eps = 1e-06) {
  n <- 100
  breaks <- seq(from, to, length.out = n)
  quantiles <- stats::quantile(x, probs = breaks)
  cutoff <- as.numeric(sub("%", "", names(quantiles))) / 100
  for (i in seq(n)) {
    if (value >= quantiles[i]) from <- max(from, cutoff[i])
    if (value <= quantiles[i]) to <- min(to, cutoff[i])
  }
  if ((to - from) <= eps) {
    result <- mean(from, to) * 100
    return(result)
  } else {
    percentile(value, x, from = from, to = to)
  }
}
