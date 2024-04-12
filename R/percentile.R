# Based on https://github.com/choonghyunryu/dlookr/blob/master/R/utils.R
get_percentile <- function(x, value, from = 0, to = 1, eps = 1e-06) {
  n <- 100
  breaks <- seq(from, to, length.out = n)
  percentile <- quantile(x, probs = breaks)
  cutoff <- as.numeric(sub("%", "", names(percentile))) / 100
  for (i in seq(n)) {
    if (value >= percentile[i]) from <- max(from, cutoff[i])
    if (value <= percentile[i]) to <- min(to, cutoff[i])
  }
  if ((to - from) <= eps) {
    result <- mean(from, to) * 100
    return(result)
  } else {
    get_percentile(x, value, from = from, to = to)
  }
}
