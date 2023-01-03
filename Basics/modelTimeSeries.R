data = read.csv("Timeseries Data.csv")

x = data$X

library(forecast)

x_ts = ts(x, frequency=12, start=c(2014,1))
plot(x_ts)

#x only
mod = auto.arima(x_ts)
result = data.frame(mod$fitted)
x_pred = forecast(mod, h= 13)

accuracy(x_pred)
plot(x_pred)

x_pred = data.frame(x_pred)