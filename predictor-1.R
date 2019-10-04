# this script uses data from the dengue_features_train dataset
dataset <- read.csv("datasets/dengue_features_train.csv")
training_lables <- read.csv("datasets/dengue_labels_train.csv")

number_of_cases_mean_temp <- cbind(training_lables, dataset$station_avg_temp_c)
names(number_of_cases_mean_temp)[names(number_of_cases_mean_temp) == "dataset$station_avg_temp_c"] <- "avg_temp"
number_of_cases_mean_temp <- number_of_cases_mean_temp[complete.cases(number_of_cases_mean_temp),]

# plot avg_temp (x) vs number of cases (y)
# with(number_of_cases_mean_temp, plot(avg_temp, total_cases))
# with(number_of_cases_mean_temp, hist(avg_temp, total_cases))
# with(number_of_cases_mean_temp, barplot(avg_temp, total_cases))

dataset <- dataset[complete.cases(dataset),]
par(mfrow=c(3,2))
with(dataset, hist(dataset$reanalysis_dew_point_temp_k, breaks = 100, main="Mean dew point temperature"))
with(dataset, hist(dataset$precipitation_amt_mm, breaks = 100, main="Total precipitation (satellite)"))
with(dataset, hist(dataset$station_precip_mm, breaks = 100, main="Total precipitation (climate station)"))
with(dataset, hist(dataset$reanalysis_avg_temp_k, breaks = 100, main=" Average air temperature"))
with(dataset, hist(dataset$reanalysis_sat_precip_amt_mm, breaks = 100, main="Total precipitation (climate forecast)"))
with(dataset, hist(dataset$reanalysis_avg_temp_k, breaks = 100, main="Average air temperature (climate forecast)"))

# histogram of temperature (Min = 22°C and Max = 32°C)
par(mfrow=c(1,1))
# for min temperature
hist(dataset$station_min_temp_c, col="green", main="Station Min Temperature")
abline(v = 22, lwd = 2, col="red")
abline(v = median(dataset$station_avg_temp_c), col="magenta", lwd = 4)

# for max temperature
hist(dataset$station_max_temp_c, col="green", main="Station Max Temperature")
rug(dataset$station_max_temp_c)
abline(v = 32, lwd = 2, col="red")
abline(v = median(dataset$station_max_temp_c), col="magenta", lwd = 4)

