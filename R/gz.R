#' Gzip Files
#'
#' Helper to gzip files on the filesystem.
#'
#' @param src filesystem path of the file to be gzipped
#' @param dest filesystem path of the resulting gzipped file
#'
#' @return None
#' @export
#' @examples
#' \dontrun{
#' gz("plot.svg", "plot.svgz")
#' }
gz <- function(src, dest) {
    out <- gzfile(dest, 'w')
    writeLines(readLines(src), out)
    close(out)
}
