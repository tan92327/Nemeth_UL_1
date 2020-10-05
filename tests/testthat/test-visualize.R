test_that("Visualize creates expected plot", {

  tt = ggplot2::mpg

  expect.plot = ggplot2::ggplot(tt) +
    ggplot2::geom_point(ggplot2::aes(x = tt[[1]], y = tt[[2]], color = tt[[3]]))

  expect_silent(visualize(ggplot2::mpg))
})
