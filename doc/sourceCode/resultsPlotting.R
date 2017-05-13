######################## ITERATIONS #############################

# iters <- rowMeans(iterations)
# itersDef <- rowMeans(iterationsDef)
#
# plot(popSize, iters, col="red", xlab = "", ylab="",axes=T, grid=T)
# par(new=T)
#
# plot(popSize, itersDef, col="blue", axes=F, grid=F, xlab = "", ylab="")
# par(new=F)
#
#
# title(ylab="Iterations", col.lab=rgb(0,0.5,0))
#
# # changing axes below
# # title(xlab="Crossover probability", col.lab=rgb(0,0.5,0))
# # title(xlab="Mutation probability", col.lab=rgb(0,0.5,0))
# title(xlab="Population size", col.lab=rgb(0,0.5,0))
#
# # title(main="Crossover function", col.main="red", font.main=4)
# title(main="Mutation function", col.main="red", font.main=4)
#
# legend(x="topright", y = "top", c("standard","custom"), cex=1.4,
#        col=c("blue","red"), pch=21:21)


######################## RESULT #############################

result <- rowMeans(results)
resultDef <- rowMeans(resultsDef)

plot(popSize, result, col="red", xlab = "", ylab="",axes=T, grid=T)
par(new=T)

plot(popSize, resultDef, col="blue", axes=F, grid=F, xlab = "", ylab="")
par(new=F)


title(ylab="Result", col.lab=rgb(0,0.5,0))

# changing axes below
# title(xlab="Crossover probability", col.lab=rgb(0,0.5,0))
# title(xlab="Mutation probability", col.lab=rgb(0,0.5,0))
title(xlab="Population size", col.lab=rgb(0,0.5,0))

# title(main="Crossover function", col.main="red", font.main=4)
title(main="Mutation function", col.main="red", font.main=4)

legend(x="bottomright", y = 198, c("standard","custom"), cex=1.4,
       col=c("blue","red"), pch=21:21)



