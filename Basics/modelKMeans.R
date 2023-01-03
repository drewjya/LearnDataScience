library(dplyr)

data = read.csv("K Means Data.csv")

set.seed(6)

wcss = vector()
for(i in 1:10) wcss[i] = sum(kmeans(data, i)$withinss)

plot(1:10, wcss, type='b',
     main = paste('cluster of plg'), xlabs = 'number', ylabs = wcss)

# build k means

set.seed(29)
kmeans6 = kmeans(data, 6, iter.max = 10,  nstart = 10)
kmeans6$size
kmeans4 = kmeans(data, 4, iter.max = 10,  nstart = 10)
kmeans10 = kmeans(data, 10, iter.max = 10,  nstart = 10)
kmeans4$size
kmeans4$centers

dataFinal = cbind(data, kmeans6$cluster)

library(clue)
dataPred = read.csv("K Means Data.csv")

result = cl_predict(kmeans4, newdata = dataPred)


table(result)