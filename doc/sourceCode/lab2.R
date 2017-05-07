rm(list = ls())

library(GA)
library(cec2013)

source("customCrossover.R")
source("customMutation.R")
source("cecF.R")

pcross <- c(0.1, 0.3, 0.5, 0.7, 0.9)
popSize <- c(25, 50, 100, 150, 300)
parameterLenhts <- length(popSize)
# number of cycles of GA executions
cycles <- 30

# cec2013 function index
cecNo <- 13

# run GA with swapped crossover function
results <- matrix(0,parameterLenhts,cycles)
iterations <- matrix(0,parameterLenhts,cycles)

for (j in 1:parameterLenhts)
{
    for(i in 1:cycles) {
      GA <- ga(type = "real-valued", 
              fitness =  function(x) -cecF(x[1], x[2]),
              min = c(-60, -20),
              max = c(10, 50),
              popSize = popSize[j]
              maxiter = 250,
              run = 30,
              crossover = customCrossover
              pcrossover = pcross[j] # probability of crossover
      )
      results[j,i] <- GA@fitnessValue
      iterations[j,i] <- GA@iter
    }
}

# run GA with default crossover function
resultsDef <- matrix(0,parameterLenhts,cycles)
iterationsDef <- matrix(0,parameterLenhts,cycles)

for (j in 1:parameterLenhts)
{
    for(i in 1:cycles) {
      GA_default <- ga(type = "real-valued",
                      fitness =  function(x) -cecF(x[1], x[2]),
                      min = c(-60, -20),
                      max = c(10, 50),
                      popSize = popSize[j],
                      maxiter = 250,
                      run = 30
                      pcrossover = pcross[j]
      )
      resultsDef[j,i] <- GA_default@fitnessValue
      iterationsDef[j,i] <- GA_default@iter
    }
}
