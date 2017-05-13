# taken untouched from
# https://github.com/cran/GA/blob/master/R/genope.R
gareal_nraMutation <- function(object, parent, ...)
{
  # Non uniform random mutation
  mutate <- parent <- as.vector(object@population[parent,])
  n <- length(parent)
  g <- 1 - object@iter/object@maxiter # dempening factor
  sa <- function(x) x*(1-runif(1)^g)
  j <- sample(1:n, 1)
  u <- runif(1)
  if(u < 0.5)
  { mutate[j] <- parent[j] - sa(parent[j] - object@max[j]) }
  else
  { mutate[j] <- parent[j] + sa(object@max[j] - parent[j]) }
  return(mutate)
}

# modification of gaperm_scrMutation
customMutation <- function(object, parent, ...)
{
  # Non uniform random mutation
  mutate <- parent <- as.vector(object@population[parent,])
  n <- length(parent)
  g <- 0.1                               # <- CHANGE
  sa <- function(x) x*(1-runif(1)^g)
  j <- sample(1:n, 1)
  u <- runif(1)
  if(u < 0.5)
  { mutate[j] <- parent[j] - sa(parent[j] - object@max[j]) }
  else
  { mutate[j] <- parent[j] + sa(object@max[j] - parent[j]) }
  return(mutate)
}
