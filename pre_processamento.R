base <- read.csv('credit_data.csv')
base$clientid = NULL
summary(base)

idade_invalida = base[base$age < 0 & !is.na(base$age),]

# # apagar somente os registros com problema
# base = base[base$age > 0,]

# preencher os dados manualmente

# calcular a média da idade
mean_age = mean(base$age[base$age > 0], na.rm = TRUE)
base$age = ifelse(base$age < 0, mean_age, base$age)

# tratamento dos valores faltantes
base$age = ifelse(is.na(base$age), mean_age, base$age)

# Escalonamento de atributos
base[, c('income', 'age', 'loan')] = scale(base)

# Encode da classe
base$default = factor(base$default, levels = c(0, 1))

# Base de treinamento e teste
library(caTools)
set.seed(1)
divisao = sample.split(base$default, SplitRatio = 0.75)
x_credit_treinamento = subset(base, divisao == TRUE)
x_credit_teste = subset(base, divisao == FALSE)


# ZeroR Classifier
div_teste = table(x_credit_teste$default)
min_accuracy = print(max(div_teste) / nrow(x_credit_teste))
min_accuracy
