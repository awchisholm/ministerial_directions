#https://www.instituteforgovernment.org.uk/charts/ministerial-directions-department-over-time

library(lubridate)
library(dplyr)
library(ggplot2)
pm <- read.csv('directions.csv', strip.white = T, check.names = F)
pm$Start <- dmy(pm$Start)
pm$End <- dmy(pm$End)

pm$Duration <- as.numeric(pm$End-pm$Start)
pm$DirectionsPerYear <- 365*pm$`Number of ministerial directions`/pm$Duration

pm$`Prime Minister` <- factor(pm$`Prime Minister`, levels = pm$`Prime Minister`)
gg <- ggplot(data=pm)
ggbar <- geom_col(mapping=aes(x=`Prime Minister`, y=DirectionsPerYear, fill=`Prime Minister`))

gglabelsx <- xlab('Prime Minister')
gglabelsy <- ylab('Ministerial Directions Per Year')
ggtitles <- ggtitle('Ministerial Directions Per Year For Recent UK Prime Ministers')
ggt <- theme(text = element_text(size=20), axis.text.x = element_text(angle=90, hjust=1)) 

gg+ggbar+gglabelsx+gglabelsy+ggtitles+ggt

