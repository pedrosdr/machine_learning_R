source('pre_processamento.R')

library(RoughSets)
dt_treinamento = SF.asDecisionTable(dataset = x_credit_treinamento, decision.attr = 4)
dt_teste = SF.asDecisionTable(dataset = x_credit_teste, decision.attr = 4)

# intervals = cut(dt_treinamento$age, breaks = 4)

intervalos = D.discretization.RST(dt_treinamento, nOfIntervals = 4)
dt_treinamento = SF.applyDecTable(dt_treinamento, intervalos)

classificador = RI.CN2Rules.RST(dt_treinamento, K = 5)
print(classificador)

previsoes = predict(classificador, newdata = dt_teste[-4])

library(caret)
table(dt_teste[,4], unlist(previsoes))

accuracy = as.numeric(summary(dt_teste[,4] == unlist(previsoes))['TRUE']) / length(unlist(previsoes))
print(accuracy)
                       