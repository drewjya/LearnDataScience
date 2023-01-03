df = read.csv("Social_Network_Ads.csv")

df$User.ID = NULL

df$Purchased = as.factor(df$Purchased)

library(caTools)
set.seed(123)


split = sample.split(df$Purchased, SplitRatio = 0.7)

trainingSet = subset(df, split==TRUE)
testSet = subset(df, split==FALSE)

#train model Random Forest
library(randomForest)
classifier = randomForest(x = trainingSet[-3], y = trainingSet$Purchased,  ntree = 10)
y_pred =predict(classifier, newdata = testSet[-3])

result = cbind(testSet, y_pred)

cm = table(testSet[,3], y_pred)

y_pred_num = as.numeric(y_pred)

colAUC(y_pred_num, testSet[,3], plotROC = TRUE)

