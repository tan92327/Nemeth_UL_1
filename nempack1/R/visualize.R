
#' Create a simple visualization of a data set
#'
#' @param dt a data.table object of a data set
#'
#' @return a ggplot object that illustrates the data
#' @export
#'
#' @examples
#' visualize(ggplot2::mpg)
#'
#' #test.table = data.table::fread("SAheart.data")
#' #visualize(test.table)
visualize = function(dt)
{


  # Get three columns
  variable1 = dt[[1]]
  variable2 = dt[[2]]
  color = dt[[3]]

  # Create testplot object, plot col 1 by 2 and color using col 3
  testplot = ggplot2::ggplot(dt) + ggplot2::geom_point(ggplot2::aes(x = variable1, y = variable2,
                                         color = color))

  # Return ggplot
  return(testplot)
}
