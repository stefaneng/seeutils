library(microbenchmark)

set.seed(13)

naive_all_same <- function(x) {
  n <- length(x)
  if(n <= 1) return(TRUE)

  length(unique(x)) == 1
}

R_all_same <- function(x) {
  n <- length(x)
  x1 <- x[1]
  if(n <= 1) return(TRUE)

  for(xi in x[2:n]) {
    if (xi != x1) return(FALSE)
  }

  return(TRUE)
}

N <- 100
same_vec <- rep(1, 1e7)

(results <- microbenchmark(
  R_all_same(same_vec),
  naive_all_same(same_vec),
  all_same(same_vec),
  .all_same_num(same_vec),
  times = N
))
