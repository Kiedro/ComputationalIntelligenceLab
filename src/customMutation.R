# taken untouched from https://github.com/cran/GA/blob/master/R/genope.R
gaperm_dmMutation <- function(object, parent, ...){
  # Displacement mutation
  parent <- as.vector(object@population[parent,])
  n <- length(parent)
  m <- sort(sample(1:n, size = 2))
  m <- seq(m[1], m[2], by = 1)
  l <- max(m)-min(m)+1
  pos <- sample(1:max(1,(n-l)), size = 1)
  i <- c(setdiff(1:n,m)[1:pos], m, setdiff(1:n,m)[-(1:pos)])
  mutate <- parent[na.omit(i)]
  return(mutate)
} 