#' Read objects from clipboard written with clip_write_obj
#'
#' @return list of objects from clipboard
#' @export
#'
clip_read_obj <- function() {
  clip <- clipr::read_clip()
  if (substr(clip, 1, 15) != "objectclipboard") {
    stop("Invalid clipboard contents")
  }
  dec <- base64enc::base64decode(substr(clip, 16, nchar(clip)))
  objects <- unserialize(dec)
  objects
}
