#CASE Study: Philippines
library(lubridate)
library(dplyr)
library(ggplot2)

data <- read.csv("ph-cases.csv")
data$date <- as.Date(data$date)
# add month index
data$month <- month(ymd(data$date))
# group by month (index)
tm <- group_by(data, month)

# sum of all cases by month
sum_by_month <- summarize(tm, df_by_month = sum(df_cases))
sum_by_month$month_name <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

# preparing for donut chart
# Compute percentages
sum_by_month$fraction <- sum_by_month$df_by_month / sum(sum_by_month$df_by_month)
# Compute the cumulative percentages (top of each rectangle)
sum_by_month$ymax <- cumsum(sum_by_month$fraction)

# Compute the bottom of each rectangle
sum_by_month$ymin <- c(0, head(sum_by_month$ymax, n=-1))
# Compute label position
sum_by_month$labelPosition <- (sum_by_month$ymax + sum_by_month$ymin) / 2

# Compute a good label
sum_by_month$label <- paste0(sum_by_month$month_name, "\n value: ", sum_by_month$df_by_month)


# Donout (all the df cases in 2013)
ggplot(sum_by_month, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=month_name)) +
  geom_rect() +
  coord_polar(theta="y") + 
  xlim(c(2, 4)) +
  ggtitle("Number of DF cases per month in 2013 - Donut chart")


# line plot
# Change the color  
ggplot(data=sum_by_month, aes(x=month_name, y=df_by_month, group=1)) +
  geom_line(color="red")+
  geom_point() +
  ggtitle("Number of DF cases per month in 2013 - Line chart")



# group by month
tm <- group_by(data, name)
temp_by_month <- summarize(tm, temp_by_month = mean(mean_temp))

ggplot(data=temp_by_month, aes(x=name, y=temp_by_month, group=1)) +
  geom_line(color="red")+
  geom_point() +
  ggtitle("Number of DF cases per month in 2013 - Line chart")


