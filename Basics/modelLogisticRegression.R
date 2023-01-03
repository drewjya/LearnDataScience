df = read.csv("Social_Network_Ads.csv")

df$User.ID = NULL

#feature scalng

df[,1:2] = scale(df[,1:2])

library(caTools)
split = sample.split(df$Purchased, SplitRatio = 0.7)

trainingSet = subset(df, split==TRUE)
testSet = subset(df, split==FALSE)

#train logistic Regression

classifier = glm(formula = Purchased ~ ., data = trainingSet, family = binomial)

#predict new data

prob_predict = predict(classifier, type = 'response', newdata = testSet[-3])

y_pref = ifelse(prob_predict>=0.5, 1, 0)

result = cbind(testSet, y_pref)

#conf matrix

cm = table(testSet[,3], y_pref)

y_pred_num = as.numeric(y_pref)

colAUC(y_pred_num, testSet[,3], plotROC = TRUE)