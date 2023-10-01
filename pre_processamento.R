#setwd('C:/Users/Lenovo/Documents/Udemy_Machine_Learning_R')
library(dplyr)

base <- read.csv('credit_data.csv')
base$clientid = NULL
glimpse(base)
summary(base)

idade_invalida = base[base$age < 0 & !is.na(base$age),]

# apagar somente os registros com problema
base = base[base$age > 0,]

# preencher os dados manualmente

# calcular a média da idade
mean_age = mean(base$age[base$age > 0], na.rm = TRUE)
base$age = ifelse(base$age < 0, mean_age, base$age)

# tratamento dos valores faltantes
base$age = ifelse(is.na(base$age), mean_age, base$age)