library(beanplot)
training_label_set <- training_lables[complete.cases(training_lables),]
dataset <- dataset[complete.cases(dataset),]

# YEAR vs CASES 
beanplot(total_cases ~ year, data=training_label_set, col="blue", main="Year ~ Number of cases")

# YEAR vs station avg temp
beanplot(station_avg_temp_c ~ year, data=dataset, col="blue", main="Year ~ Avg Temperature")

