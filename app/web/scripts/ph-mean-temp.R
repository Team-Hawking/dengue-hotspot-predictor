#CASE Study: Philippines (mean temperature)
library(lubridate)
library(dplyr)
library(ggplot2)

month_index <- data.frame(
  index = 1:12,
  name =  c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
)

data <- read.csv("ph-mean-temp.csv")
data$date <- as.Date(data$date)
# add month index
data$month <- month(ymd(data$date))
# data$month_name <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

data <- merge(data,month_index, by.x = "month", by.y = "index")


# plot graphs
# bar chart
g <- ggplot(data, aes(name, mean_temp))
g + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  labs(title="Mean temperature (°C) in 2013", 
       subtitle="") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

# for timeseries
theme_set(theme_classic())
# Allow Default X Axis Labels
ggplot(data, aes(x=name)) + 
  geom_line(aes(y=mean_temp)) + 
  labs(title="Time Series Chart", 
       subtitle="Returns Percentage from 'Economics' Dataset", 
       caption="Source: Economics", 
       y="Returns %")

theme_set(theme_classic())
# for box plot
g <- ggplot(data, aes(name, mean_temp))
g + geom_boxplot(varwidth=T, fill="plum") + 
  labs(title="Box plot", 
       subtitle="City Mileage grouped by Class of vehicle",
       caption="Source: mpg",
       x="Class of Vehicle",
       y="City Mileage")


library(ggthemes)
g <- ggplot(data, aes(name, mean_temp))
g + geom_boxplot(aes(fill=factor(mean_temp))) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Box plot", 
       subtitle="City Mileage grouped by Class of vehicle",
       caption="Source: mpg",
       x="Class of Vehicle",
       y="City Mileage")


# violin plot
theme_set(theme_bw())
# plot
g <- ggplot(data, aes(name, mean_temp))
g + geom_violin() + 
  labs(title="Violin plot", 
       subtitle="City Mileage vs Class of vehicle",
       caption="Source: mpg",
       x="Class of Vehicle",
       y="City Mileage")


# density plot
theme_set(theme_classic())

# Plot
g <- ggplot(data, aes(mean_temp))
g + geom_density(aes(fill=factor(mean_temp)), alpha=0.8) + 
  labs(title="Density plot", 
       subtitle="City Mileage Grouped by Number of cylinders",
       caption="Source: mpg",
       x="City Mileage",
       fill="# Cylinders")

# group by month
tm <- group_by(data, name)
temp_by_month <- summarize(tm, temp_by_month = mean(mean_temp))


# Plot
g <- ggplot(data, aes(mean_temp))
g + geom_density(aes(fill=factor(mean_temp)), alpha=0.8) + 
  labs(title="Density plot", 
       subtitle="Mean temperature by month in 2013",
       caption="",
       x="Temperature (°C)",
       fill="# Degree")
