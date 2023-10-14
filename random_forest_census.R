source('pre_processamento_census.R')

library(randomForest)
set.seed(1)
classificador = randomForest(x = x_census_treinamento[,-15], y = x_census_treinamento[,15], ntree=100)
previsoes = predict(classificador, newdata = x_census_teste[,-15])

library(caret)
caret::confusionMatrix(table(x_census_teste[,15], previsoes))
