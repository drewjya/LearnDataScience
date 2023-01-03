df = read.csv("Social_Network_Ads.csv")

df$User.ID = NULL

#feature scalng

library(caTools)
set.seed(123)

df[,1:2] = scale(df[,1:2])

split = sample.split(df$Purchased, SplitRatio = 0.7)

trainingSet = subset(df, split==TRUE)
testSet = subset(df, split==FALSE)

#train model KNN

library(class)

y_pred = knn(train = trainingSet[, -3], test = testSet[,-3], cl = trainingSet[,3], k = 5)

result = cbind(testSet, y_pred)

cm = table(testSet[,3], y_pred)

y_pred_num = as.numeric(y_pred)

colAUC(y_pred_num, testSet[,3], plotROC = TRUE)