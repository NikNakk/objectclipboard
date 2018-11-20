#' Read first object from clipboard written with clip_write_obj
#'
#' @return object from clipboard (could be of any type)
#' @export
#'
clip_read1_obj <- function() {
  objects <- clip_read_obj()
  objects[[1]]
}
