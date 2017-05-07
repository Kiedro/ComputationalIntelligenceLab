# modyfication of gareal_waCrossover taken from https://github.com/cran/GA/blob/master/R/genope.R

customCrossover <- function(object, parents, ...)
{
  # Whole arithmetic crossover
  parents <- object@population[parents,,drop = FALSE]
  n <- ncol(parents)
  children <- matrix(as.double(NA), nrow = 2, ncol = n)
  a <- 0.6
  b <- 0.4
  children[1,] <- a*parents[1,] + b*parents[2,]
  children[2,] <- b*parents[2,] + a*parents[1,]
  out <- list(children = children, fitness = rep(NA,2))
  return(out)
}
