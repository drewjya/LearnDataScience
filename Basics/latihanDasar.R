df = read.csv("Social_Network_Ads.csv")
df$User.ID = NULL
set.seed(123 )

split = sample.split(df$Purchased, SplitRatio = 0.7)

trainingSet = subset(df, split==TRUE)
testSet = subset(df, split==FALSE)

trainingSet$Purchased = as.factor(trainingSet$Purchased)
testSet$Purchased = as.factor(testSet$Purchased)


summary(testSet$Purchased)


