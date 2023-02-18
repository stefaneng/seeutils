test_that("default_args and required_args works", {
  test_func <- function(x, y = 1) {}
  testthat::expect_equal(
    default_args(test_func),
    list(y = 1)
    )

  testthat::expect_equal(
    required_args(test_func),
    "x"
    )

  test_func2 <- function() {}

  testthat::expect_null(
    default_args(test_func2)
    )

  testthat::expect_null(
    required_args(test_func2)
    )
})
