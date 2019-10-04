# loading dataset of US state temperature
# all the data points are similar. Why?
#data <-read.csv("datasets/earth-surface-temperature-data0.csv")
#summary(data)
#table(data)

dat <- readLines("datasets/giss-101.csv");

gissdata <- read.csv("datasets/giss-101.csv", skip=1)
summary(gissdata)
table(gissdata)
gissdata <- subset(gissdata, Year >= 2000)

model <- lm(gissdata$Jan ~ gissdata$Year)

gissdata$Sep <- numeric(gissdata$Sep)

#plot(y,x,col = "blue",main = "Height & Weight Regression",
#     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")
par(mfrow=c(3,4))
boxplot(gissdata$Jan)
boxplot(gissdata$Feb)
boxplot(gissdata$Mar)
boxplot(gissdata$Apr)
boxplot(gissdata$May)
boxplot(gissdata$Jun)
boxplot(gissdata$Jul)
boxplot(gissdata$Aug)
boxplot(gissdata$Sep)
boxplot(gissdata$Oct)
boxplot(gissdata$Nov)
boxplot(gissdata$Dec)
















#plot(gissdata$Year, gissdata$Jan)
#plot(model)