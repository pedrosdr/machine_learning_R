base <- read.csv('credit_data.csv')
base$clientid = NULL

# calcular a média da idade
mean_age = mean(base$age[base$age > 0], na.rm = TRUE)
base$age = ifelse(base$age < 0, mean_age, base$age)

# tratamento dos valores faltantes
base$age = ifelse(is.na(base$age), mean_age, base$age)

# Escalonamento de atributos
base[, c('income', 'age', 'loan')] = scale(base)

# divisão entre treinamento e teste
library(caTools)
set.seed(1)
divisao = sample.split(base$income, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)
xtrain = base_treinamento[, -4]
xtest = base_teste[, -4]
ytrain = base_treinamento[, 4]
ytest = base_teste[, 4]

library(class)
previsoes = class::knn(train = xtrain, test = xtest, cl = ytrain, k = 5)

library(caret)
caret::confusionMatrix(table(ytest, previsoes))
