rm(list = ls())

library(GA)
library(cec2013)

source("customCrossover.R")
source("customMutation.R")
source("cecF.R")


# number of cycles of GA executions
cycles <- 1

# cec2013 function index
cecNo <- 13


# run GA with swapped mutation function
results <- 0
iterations <- 0
meanValues <- 0

for(i in 1:cycles) {
  GA <- ga(type = "real-valued",                       # for optimization problems where the decision variables are ...
           # ... floating-point representations of real numbers
           fitness =  function(x) -cecF(x[1], x[2]),   # fitness function - takes as input an individual string representing ...
           # ... a potential solution, and returns a numerical value describing its fitness.
           min = c(-60, 10),              # a vector of length equal to the decision variables providing the minimum of the search space
           max = c(-20, 50),              # like above but maximum; c() function combines arguments and creates vector from them
           popSize = 50,                  # population size
           maxiter = 1000,                # maximum number of iterations to run before the GA search is halted
           run = 100,                      # the number of consecutive generations without any improvement ...
           # ... in the best fitness value before the GA is stopped
           #pmutation  - probability of mutation
           #pcrossover - probability of crossover
           #elitism    - number of best fitness individuals
           mutation = gaperm_dmMutation
  )
  results[i] <- GA@fitnessValue
  meanValues[i] <- tail(GA@summary[,"mean"], n=1)
  iterations[i] <- GA@iter
}


# run GA with default mutation function

resultsDef <- 0
iterationsDef <- 0
meanValuesDef <- 0

for(i in 1:cycles) {
  GA_default <- ga(type = "real-valued",                       # for optimization problems where the decision variables are ...
                   # ... floating-point representations of real numbers
                   fitness =  function(x) -cecF(x[1], x[2]),   # fitness function - takes as input an individual string representing ...
                   # ... a potential solution, and returns a numerical value describing its fitness.
                   min = c(-60, 10),              # a vector of length equal to the decision variables providing the minimum of the search space
                   max = c(-20, 50),              # like above but maximum; c() function combines arguments and creates vector from them
                   popSize = 50,                  # population size
                   maxiter = 1000,                # maximum number of iterations to run before the GA search is halted
                   run = 100                      # the number of consecutive generations without any improvement ...
                   # ... in the best fitness value before the GA is stopped
                   #pmutation  - probability of mutation
                   #pcrossover - probability of crossover
                   #elitism    - number of best fitness individuals
  )
  resultsDef[i] <- GA_default@fitnessValue
  meanValuesDef[i] <- tail(GA_default@summary[,"mean"], n=1)
  iterationsDef[i] <- GA_default@iter
}

print("Swapped:")
print(summary(GA))
plot(GA, col="red")
par(new=T)
print(mean(results))
print(mean(meanValues))
print(mean(iterations))

print("Default:")
print(summary(GA_default))
plot(GA_default, col="green", axes=F, grid=F)
par(new=F) # dont erase previous plot (to show both)
print(mean(resultsDef))
print(mean(meanValuesDef))
print(mean(iterationsDef))


