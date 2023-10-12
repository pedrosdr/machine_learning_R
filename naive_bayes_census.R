source('pre_processamento_census.R')

library(e1071)
naive_census = naiveBayes(x = x_census_treinamento[-15], y = x_census_treinamento$income)
naive_census
previsoes = predict(naive_census, newdata = x_census_teste[-15])

# print(summary(previsoes == x_census_teste$income))

matriz_confusao = table(x_census_teste[,15], previsoes)

library(caret)
confusionMatrix(matriz_confusao)