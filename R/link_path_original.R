#' Trace a symlink back to it's source file
#'
#' @param symlink Symbolic link to trace back
#'
#' @return path to original file
#' @export
#' @examples
#' library(fs)
#' file_create("/tmp/a")
#' link_create("/tmp/a", "/tmp/b")
#' link_create("/tmp/b", "/tmp/c")
#' link_path_original("/tmp/c")
link_path_original <- function(symlink) {
  symlink <- fs::path(symlink)
  if (fs::file_info(symlink)$type != "symlink") {
    return(symlink)
  } else {
    return(link_path_original(fs::link_path(symlink)))
  }
}
