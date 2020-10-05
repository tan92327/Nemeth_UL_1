test_that("KMEANS runs without errors", {
  expect_silent(KMEANS(ggplot2::mpg, 5))
})
