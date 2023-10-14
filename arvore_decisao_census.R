source('pre_processamento_census.R')

library(rpart)
classificador = rpart(formula = income ~ ., data = x_census_treinamento)
poda = classificador$cptable[which.min(classificador$cptable[, 'xerror']), 'CP']
classificador = prune(classificador, 0.05)

library(rpart.plot)
rpart.plot(classificador)
previsoes = predict(classificador, newdata = x_census_teste[-15], type = 'class')

library(caret)
confusionMatrix(table(x_census_teste$income ,previsoes))
