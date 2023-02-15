#' Check if all elements are unique
#'
#' @param x Numeric or character vector
#'
#' @return logical indicating T for unique, F for non-unique (vector is all the same value)
#' @export
#'
#' @examples
#' all_same(c(1,2,3,4))
#' all_same(c(1,1,1,1))
all_same <- function(x) {
  if (is.numeric(x)) return(as.logical(.all_same_num(x)))
  else if (is.character(x)) return(as.logical(.all_same_chr(x)))
  stop('Only supports numeric or character vectors')
}
