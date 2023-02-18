# See: https://stackoverflow.com/questions/42118105/how-to-explicitly-call-the-default-value-of-a-function-argument-in-r

filter_default <- function(func, keep = c('required', 'default')) {
  keep <- match.arg(keep)
  func_args <- formals(func)

  if (keep == 'required') {
    f <- identical
  } else if (keep == 'default') {
    f <- Negate(identical)
  }

  func_args[unlist(lapply(func_args, f, quote(expr = )))]
}

#' Title
#'
#' @param func
#'
#' @return
#' @export
#'
#' @examples
default_args <- function(func) {
  # Maybe want to default to names? since this returns paired
  res <- filter_default(func, keep = 'default')
  if (is.null(res)) res
  else as.list(res)
}

#' Title
#'
#' @param func
#'
#' @return
#' @export
#'
#' @examples
required_args <- function(func) {
  names(filter_default(func, keep = 'required'))
}
