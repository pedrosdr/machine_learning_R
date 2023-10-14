source('pre_processamento_census.R')

library(RoughSets)
dt_treinamento = SF.asDecisionTable(x_census_treinamento, decision.attr = 15)
dt_teste = SF.asDecisionTable(x_census_teste, decision.attr = 15)

intervalos = D.discretization.RST(dt_treinamento, nOfIntervals = 4)
dt_treinamento = SF.applyDecTable(dt_treinamento, intervalos)
dt_teste = SF.applyDecTable(dt_teste, intervalos)

classificador = RI.CN2Rules.RST(dt_treinamento, K = 1)
print(classificador)

previsoes = predict(classificador, newdata = dt_teste[-15])

matriz_confusao = table(dt_teste[, 15], unlist(previsoes))

library(caret)
caret::confusionMatrix(matriz_confusao)
