library(dplyr)

base <- read.csv('census.csv')
base$X = NULL
glimpse(base)
