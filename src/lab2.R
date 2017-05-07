rm(list = ls())

library(GA)
library(cec2013)

source("customCrossover.R")
source("customMutation.R")
source("cecF.R")

# pcross <- c(0.1, 0.3, 0.5, 0.7, 0.9)
popSize <- c(25, 50,100,150 ,300)
parameterLenhts <- length(popSize)
# number of cycles of GA executions
cycles <- 2

# cec2013 function index
cecNo <- 13


# run GA with swapped mutation function
results <- matrix(0,parameterLenhts,cycles)
iterations <- matrix(0,parameterLenhts,cycles)
# meanValues <- matrix(0,parameterLenhts,cycles)

for (j in 1:parameterLenhts)
{
for(i in 1:cycles) {
  GA <- ga(type = "real-valued",                       # for optimization problems where the decision variables are ...
           # ... floating-point representations of real numbers
           fitness =  function(x) -cecF(x[1], x[2]),   # fitness function - takes as input an individual string representing ...
           # ... a potential solution, and returns a numerical value describing its fitness.
           min = c(-60, -20),              # a vector of length equal to the decision variables providing the minimum of the search space
           max = c(10, 50),              # like above but maximum; c() function combines arguments and creates vector from them
           popSize = popSize[j],                  # population size
           # maxiter = maxIters[j],                # maximum number of iterations to run before the GA search is halted
           run = 30,                      # the number of consecutive generations without any improvement ...
           # ... in the best fitness value before the GA is stopped
           #pmutation  - probability of mutation
           crossover = customCrossover
           # pcrossover = pcross[j] # probability of crossover
           #elitism    - number of best fitness individuals
           # mutation = gaperm_dmMutation
  )
  results[j,i] <- GA@fitnessValue
  # meanValues[i] <- tail(GA@summary[,"mean"], n=1)
  iterations[j,i] <- GA@iter
}
}


# run GA with default mutation function

resultsDef <- matrix(0,parameterLenhts,cycles)
iterationsDef <- matrix(0,parameterLenhts,cycles)
# meanValuesDef <- matrix(0,parameterLenhts,cycles)

for (j in 1:parameterLenhts)
{
  
for(i in 1:cycles) {
  GA_default <- ga(type = "real-valued",                       # for optimization problems where the decision variables are ...
                   # ... floating-point representations of real numbers
                   fitness =  function(x) -cecF(x[1], x[2]),   # fitness function - takes as input an individual string representing ...
                   # ... a potential solution, and returns a numerical value describing its fitness.
                   min = c(-60, -20),              # a vector of length equal to the decision variables providing the minimum of the search space
                   max = c(10, 50),               # like above but maximum; c() function combines arguments and creates vector from them
                   popSize = popSize[j],                  # population size
                   # maxiter = maxIters[j],                # maximum number of iterations to run before the GA search is halted
                   run = 30                     # the number of consecutive generations without any improvement ...
                   # ... in the best fitness value before the GA is stopped
                   #pmutation  - probability of mutation
                   # pcrossover = pcross[j]  #- probability of crossover
                   #elitism    - number of best fitness individuals
  )
  resultsDef[j,i] <- GA_default@fitnessValue
  # meanValuesDef[i] <- GA_default@summary[,"mean"]
  iterationsDef[j,i] <- GA_default@iter
}
}

print("Swapped:")
print(summary(GA))
plot(GA, col="red")
par(new=T)
print(mean(results))
# print(mean(meanValues))
print(mean(iterations))

print("Default:")
print(summary(GA_default))
plot(GA_default, col="green", axes=F, grid=F)
par(new=F) # dont erase previous plot (to show both)
print(mean(resultsDef))
# print(mean(meanValuesDef))
print(mean(iterationsDef))

plot(seq(1,length(GA@summary[, "max"])),GA@summary[,"max"])