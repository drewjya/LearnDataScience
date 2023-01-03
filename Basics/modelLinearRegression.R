df = read.csv("Salary_Data.csv")

library(caTools)

set.seed(123)

split = sample.split(df$Salary, SplitRatio = 0.7)

trainingSet = subset(df, split==TRUE)
testSet = subset(df, split==FALSE)

regressor = lm(formula = Salary ~ YearsExperience, data = trainingSet)

y_pred = predict(regressor, newdata = testSet)

result = cbind(testSet, y_pred)