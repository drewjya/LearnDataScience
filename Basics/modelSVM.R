df = read.csv("Social_Network_Ads.csv")

df$User.ID = NULL

#feature scalng

library(caTools)
set.seed(123)

df[,1:2] = scale(df[,1:2])

split = sample.split(df$Purchased, SplitRatio = 0.7)

trainingSet = subset(df, split==TRUE)
testSet = subset(df, split==FALSE)

#train model SVM

library(e1071)

classifier = svm(formula = Purchased ~ ., 
                 data = trainingSet, type = 'C-classification',
                 kernel = 'linear'
                 )

y_pred = predict(classifier, newdata = testSet[-3])

result = cbind(testSet, y_pred)