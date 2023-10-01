#setwd('C:/Users/Lenovo/Documents/Udemy_Machine_Learning_R')
library(dplyr)

df <- read.csv('credit_data.csv')
df$clientid = NULL
glimpse(df)
summary(df)
