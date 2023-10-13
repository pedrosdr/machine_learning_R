source('pre_processamento.R')

library(rpart)
classificador = rpart(formula = default ~ ., data=x_credit_treinamento)
print(classificador)

library(rpart.plot)
rpart.plot(classificador)

previsoes = predict(classificador, newdata = x_credit_teste[-4], type = 'class')
matriz_confusao = table(x_credit_teste[,4], previsoes)
matriz_confusao

library(caret)
confusionMatrix(matriz_confusao)
