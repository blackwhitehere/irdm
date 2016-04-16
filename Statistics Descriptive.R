# Date : 16 Aprl 2016
# Author : Hermawan Budyanto 
# Title: Statitical Descriptive of Corn Price and Oth Commodities
# Data : 10YearsFeaturesCorn.csv and Corn_m.csv


rm(list=ls())

library(dplyr)
library(xts)
library(ggplot2)
# import dataset
dataset <- read.csv("~/Downloads/IRDM2016/10YearsFeaturesCorn.csv",header=T)
date <- as.Date(as.character(dataset$Date),format='%d/%m/%Y')
dataset$Date <- NULL
dataset.ts <- xts(dataset, date)

names(dataset)

par (mfrow= c (3,4)) 
for (i in 1:10) { plot(dataset.ts[,i],main= names(dataset.ts)[i]) }
#install.packages("xtsExtra", repos="http://R-Forge.R-project.org")

subset <- select(dataset, Corn, Ethanol, Wheat, Soyabean, Crude.Oil, Green.Plains)
subset.ts <- xts(subset, date)

# Dataset 1
par (mfrow= c (3,2)) 
for (i in 1:6) { plot(subset.ts[,i],main= names(subset.ts)[i]) }
#install.packages("xtsExtra", repos="http://R-Forge.R-project.org")

# Dataset 2
c1 = c("Corn","Wheat", "Soyabean")
boxplot(coredata(subset.ts[,c1]), ylab='Price', main = 'Boxplot of Selected Commodities(1)')

# Dataset 3
c2 = c("Ethanol","Crude.Oil", "Green.Plains")
boxplot(coredata(subset.ts[,c2]), ylab='Price', main = 'Boxplot of Selected Commodities(2)')


# Appendix 1
require(PerformanceAnalytics)
chart.Boxplot(subset.ts, xlab = 'Price', main ='Boxplot of Selected Commodities')

# Appedix 2
myColors <- c("red", "darkgreen", "goldenrod", "darkblue", "darkviolet",
              "yellow","purple", "brown", "green")
plot(x = dataset.ts[,'Corn'], ylim = c(0.0, 1800),xlab = "Date", ylab = "Price",
     main = "Commodities Price", major.ticks= "years",
     minor.ticks = FALSE, col = "red")
lines(x = dataset.ts[,"Ethanol"], col = "darkgreen")
lines(x = dataset.ts[,"Crude.Oil"], col = "goldenrod")
lines(x = dataset.ts[,"ADM"], col = "darkblue")
lines(x = dataset.ts[,"Bunge"], col = "darkviolet")
lines(x = dataset.ts[,"Con.Agra"], col = "yellow")
lines(x = dataset.ts[,"Green.Plains"], col = "purple")
lines(x = dataset.ts[,"Wheat"], col = "brown")
lines(x = dataset.ts[,"Soyabean"], col = "green")
legend(x = 'topleft', legend = c("Corn", "Ethanol","Crude.Oil","Live.Cattle","ADM","Bunge",
                                 "Con.Agra","Green.Plains","Wheat","Soyabean"),
       lty = 2, col = myColors)


# import dataset
corn <- read.csv("~/Downloads/IRDM2016/Corn_m.csv",header=T)
colnames(corn)[1] <- "open_price"
date1 <- as.Date(as.character(corn$Date),format='%d/%m/%Y')
corn$Date <- NULL
corn.ts <- xts(corn, date1)

plot(corn.ts, ylab= "Price", xlab= "Date", main ="Time Series Plot of Corn's Opening Price")

min(corn.ts)
