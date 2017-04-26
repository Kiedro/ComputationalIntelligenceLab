library(GA)
library(globalOptTests)
#library(plotly)

functionName <- 'BeckerLago'

bounds <- getDefaultBounds(functionName)

functionToOptimize <- function(x,y){
  goTest(c(x,y), functionName)
}


#x1 <-x2 <- seq(-20,20, by = 0.1)
byValue <- 0.2
x1 <- seq(bounds$lower[1], bounds$upper[1], by=byValue)
x2 <- seq(bounds$lower[2], bounds$upper[2], by=byValue)
f <- outer(x1, x2, Vectorize(functionToOptimize))
#p <- plot_ly(z = f) %>% add_surface()
 # persp3D(x1,x2,f)
  filled.contour(x1, x2, f, color.palette = bl2gr.colors)
 
# GA <- ga(type = "real-valued",
#          fitness =  function(x) -functionToOptimize(x[1], x[2]),
#          min = c(-55, -55), max = c(50, 50),
#          popSize = 20, maxiter = 1000, run = 100)
# summary(GA)
# plot(GA)
# 
# getGlobalOpt(functionName)



# f = outer(x1, x2, wrapperForPlot)
# z <- matrix(unlist(f), ncol = 21, byrow = TRUE)
# persp3D(x1,x2,z)

# wrapperForPlot <- function(x,y){
#   params <- list()
#   for (i in 1:length(x)){
#     params[[i]] <- c(x[i],y[i])
#   }
#   
#   result <- lapply(params, secondWrapper)
#   matrix(unlist(result), ncol = 21, byrow = TRUE)
# }
# 
# secondWrapper = function(x){
#   goTest(c(x[1],x[2]), functionName)
# }