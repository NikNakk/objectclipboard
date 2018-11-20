#' Assign objects from clipboard written with clip_write_obj
#'
#' @param envir environment in which to assign the objects, defaults to global
#'
#' @return NULL, invisibly
#' @export
#'
clip_assign_obj <- function(envir = .GlobalEnv) {
  objects <- clip_read_obj()
  for (i in seq_along(objects)) {
    assign(names(objects)[i], objects[[i]], envir = envir)
  }
  invisible(NULL)
}
