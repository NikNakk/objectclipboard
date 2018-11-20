#' Write object(s) to clipboard
#'
#' @param ... Objects to write, optionally with names
#'
#' @return objects passed in as a list, invisibly
#' @export
#'
clip_write_obj <- function(...) {
  objects <- rlang::quos(...)
  if (any(names(objects) == "")) {
    deparsed_objects <- lapply(objects, function(x) rlang::expr_text(rlang::get_expr(x)))
    names(objects)[names(objects) == ""] <- deparsed_objects[names(objects) == ""]
  }
  ev_objects <- lapply(objects, rlang::eval_tidy)
  ser_objects <- serialize(ev_objects, NULL)
  b64 <- base64enc::base64encode(ser_objects)
  clipr::write_clip(paste0("objectclipboard", b64))
  invisible(ev_objects)
}
