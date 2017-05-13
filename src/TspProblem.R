rm(list = ls())

library(GA)
library(TSP)

# "global" variable used by everything
tsp <- read_TSPLIB(system.file("examples/kroA100.tsp", package = "TSP", mustWork = T))

# best possible
# optimalTour <- solve_TSP(tsp, method = "nn", two_opt = TRUE)
# plot(tsp, optimalTour, cex=.6, col = "red", pch= 3, main = "TSPLIB: kroA100")

################ implementation ###############
pcross <- c(0.1, 0.3, 0.5, 0.7, 0.9)
popSize <- c(10,25,50,100,250)
parameterLenghts <- length(popSize)
# number of cycles of GA executions
cycles <- 15


getFitness <- function(sequention, tspProblem){
  tour <- TOUR(sequention, method = NA, tsp = tspProblem)
  tour_length(tour)
}

results <- matrix(0,parameterLenghts,cycles)
iterations <- matrix(0,parameterLenghts,cycles)

for (j in 1:parameterLenghts){
  for(i in 1:cycles){
    GA <- ga(type = "permutation",
         fitness =  function(x) -getFitness(x, tsp),   # fitness function - takes as input an individual string
                                                       # representing a potential solution, and returns a numerical value describing its fitness.
         pcrossover = pcross[j],
         min = 1,
         max = 100,
         # popSize = popSize[j],  # population size
         maxiter = 250,         # maximum number of iterations to run before the GA search is halted
         run = 100,             # the number of consecutive generations without any improvement ...
         optim = T
    )
    results[j,i] <- GA@fitnessValue
    iterations[j,i] <- GA@iter
  }
}

###############################################

#possibly more than one solution - starting coty may diff
result = TOUR(GA@solution[1,], method = NA, tsp = tsp)
plot(tsp, result, cex=.6, col = "red", pch= 3, main = "TSPLIB: kroA100")

