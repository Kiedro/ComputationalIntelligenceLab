rm(list = ls())

library(GA)
library(cec2013)

# cec2013 function index
cecNo <- 9

# function setup:
cecF <- function(x1, x2)
{
  vec <- rep(0, 2)                    # create vector [0, 0]
  vec[1] = x1                         # assign x1 to the first coordinate of the vector
  vec[2] = x2                         # assign x2 to the second coordinate
  cec2013(cecNo, vec)                 # execute cec function indicated by cecNo with vec vector
}

x1 <- seq(-60, 10, by = 0.1)          # seq() - generate function args - vector of 201 values from -500 to 500 with step of 5 ...
x2 <- seq(-20, 50, by = 0.1)          # ... like -500, -495, -490, ... , 495, 500; for x1 and x2 each


customCrossover <- function(object, parents, ...){
	parents <- object@population[parents,,drop = FALSE]
  
}

myMutation <- function (x, i) 
{
  return(rnorm(n=1, m=0, sd=3))
} 
# execution of genetic algorythm to search for global minimum
results <- 0
iterations <- 0
meanValues <- 0

for(i in 1:1) {
  GA <- ga(type = "real-valued",                       # for optimization problems where the decision variables are floating-point representations of real numbers
           fitness =  function(x) -cecF(x[1], x[2]),   # fitness function - takes as input an individual string representing a potential solution, and returns a numerical value describing its â€ofitnessâ€?.
           min = c(-50, -50),                        # a vector of length equal to the decision variables providing the minimum of the search space
           max = c(50, 50),                          # like above but maximum; c() function combines arguments and creates vector from them
           popSize = 50,                               # population size
           maxiter = 10,                             # maximum number of iterations to run before the GA search is halted
           run = 300                                          # the number of consecutive generations without any improvement in the best fitness value before the GA is stopped
           ,crossover = customCrossover
           ,mutation = myMutation
           )
  results[i] <- GA@fitnessValue
  meanValues[i] <- GA@summary[,2]
  iterations[i] <- GA@iter
}
summary(GA)
plot(GA)

mean(results)
mean(meanValues)
mean(iterations)





