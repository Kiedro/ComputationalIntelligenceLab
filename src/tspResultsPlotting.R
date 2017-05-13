
# result <- -rowMeans(results)
#
# plot(popSize, result, col="red", xlab = "", ylab="",axes=T, grid=T)
# par(new=T)
#
#
# title(ylab="Result", col.lab=rgb(0,0.5,0))
# title(xlab="Population size", col.lab=rgb(0,0.5,0))
#
# title(main="kroa100", col.main="red", font.main=4)



#####################################################


result <- -rowMeans(results)

plot(pcross, result, col="red", xlab = "", ylab="",axes=T, grid=T)
par(new=T)


title(ylab="Result", col.lab=rgb(0,0.5,0))
title(xlab="Crossover probability", col.lab=rgb(0,0.5,0))

title(main="kroa100", col.main="red", font.main=4)

