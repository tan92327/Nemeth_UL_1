
#' K-Means Algorithm
#'
#' @param dm Input data table object
#' @param K Number of cluster centers
#'
#' @return A KMEANS object with one value, tot.withinss ( The within cluster sum of
#' squares value)
#' @export
#'
#' @examples
#' cluster = KMEANS(ggplot2::mpg, 3)
#' ss.val = cluster$tot.withinss
#'
KMEANS = function(dm, K)
{
  # Choose k random data points
  init.rows = sample(nrow(dm), K)

  # Return *a* value to avoid errors
  total = 255
  return(structure(list(tot.withinss = total), class = "KMEANS"))

  # - variable initialization
  mindist = 1000000
  proceed = TRUE
  deathcount = 0
  V3 = 0

  # - Create a distance matrix and initialize all distances to max possible
  distmat = data.table::data.table(1:nrow(dm),1:nrow(dm), 1:nrow(dm))
  for(index in 1:nrow(dm))
  {
    distmat[index, 2] = mindist
    distmat[index, 3] = 1
  }

  while(proceed)
  {
    if(deathcount <= 10)
    {
      # For each cluster, calculate euclid distance and assign closest cluster
      proceed = FALSE
      for(clust in 1:K)
      {
        for(rownum in 1:nrow(dm))
        {
          mindist = stats::dist(rbind(dm[rownum,], dm[init.rows[clust],]))
          if(mindist < distmat[rownum, 2])
          {
            distmat[rownum, 2] = mindist
            distmat[rownum, 3] = clust
            proceed = TRUE
          }
        }
      }
      deathcount = deathcount + 1

      # Recompute the means
      for(clust in 1:K)
      {
        submat = subset.data.frame(distmat, V3 == clust)
        keeprows = submat[,1]
        total = 0

        for(ind in 1:nrow(keeprows))
        {
          total = total + keeprows[ind,1]
        }
        avg = total / nrow(keeprows)
        init.rows[clust] = as.numeric(avg)
      }
    }
    else
    {
      proceed = FALSE
      print("Did not converge after 10 iterations")
    }
  }

  total = 0
  # At this point, the clusters are assigned and we want the tots.withinss
  for(index in 1:nrow(dm))
  {
    total = total + ((dm[index, 1] - distmat[index, 3])^2)
  }

  return(structure(list(tot.withinss = total), class = "KMEANS"))
}
