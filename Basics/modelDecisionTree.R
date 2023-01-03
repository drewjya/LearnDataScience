df = read.csv("Social_Network_Ads.csv")

df$User.ID = NULL

#feature scalng

library(caTools)
set.seed(123)


split = sample.split(df$Purchased, SplitRatio = 0.7)

trainingSet = subset(df, split==TRUE)
testSet = subset(df, split==FALSE)

#train model Decision Tree
library(rpart)

classifier = rpart(formula = as.factor(Purchased) ~ ., data = trainingSet)

y_pred =predict(classifier, newdata = testSet[-3], type = 'class')

result = cbind(testSet, y_pred)