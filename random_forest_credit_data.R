source('pre_processamento.R')

library(randomForest)
set.seed(1)
classificador = randomForest(x = x_credit_treinamento[,-4], y = x_credit_treinamento[,4], ntree = 100)
previsoes = predict(classificador, x_credit_teste[,-4])

library(caret)
confusionMatrix(table(x_credit_teste[,4], previsoes))
