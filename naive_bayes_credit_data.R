source('pre_processamento.R')

library(e1071)
classificador = naiveBayes(x = x_credit_treinamento[-4], y = x_credit_treinamento$default)
predicted_classes = predict(classificador, newdata = x_credit_teste[-4])
predicted_classes == x_credit_teste$default

matriz_confusao = table(x_credit_teste[, 4], predicted_classes)
matriz_confusao
perc_acertos = 100 * as.numeric(summary(predicted_classes == x_credit_teste$default)['TRUE']) / length(predicted_classes)

library(caret)
confusionMatrix(matriz_confusao)
