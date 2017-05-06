
iters <- rowMeans(iterations)
itersDef <- rowMeans(iterationsDef)


plot(maxIters, iters, col="red", xlab = "", ylab="",axes=T, grid=T)
par(new=T)

plot(maxIters, itersDef, col="blue", axes=F, grid=F, xlab = "", ylab="")
par(new=F)

title(ylab="Iterations", col.lab=rgb(0,0.5,0))
# title(xlab="Crossover probability", col.lab=rgb(0,0.5,0))
title(xlab="Maximum number of iterations", col.lab=rgb(0,0.5,0))

title(main="Crossover function", col.main="red", font.main=4)

legend(x="topright", y = "top", c("standard","custom"), cex=1.4, 
       col=c("blue","red"), pch=21:21)




#####################################################


result <- rowMeans(results)
resultDef <- rowMeans(resultsDef)


plot(maxIters, result, col="red", xlab = "", ylab="",axes=T, grid=T)
par(new=T)

plot(maxIters, resultDef, col="blue", axes=F, grid=F, xlab = "", ylab="")
par(new=F)

title(ylab="Result", col.lab=rgb(0,0.5,0))
# title(xlab="Crossover probability", col.lab=rgb(0,0.5,0))
title(xlab="Maximum number of iterations", col.lab=rgb(0,0.5,0))

title(main="Crossover function", col.main="red", font.main=4)

legend(x="topright", y = "top", c("standard","custom"), cex=1.4, 
       col=c("blue","red"), pch=21:21)



