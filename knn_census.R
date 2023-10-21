source('pre_processamento_census.R')

base_teste = x_census_teste
base_treinamento = x_census_treinamento

xtrain = base_treinamento[, -15]
xtest = base_teste[, -15]
ytrain = base_treinamento[, 15]
ytest = base_teste[, 15]

xtrain = as.data.frame(apply(xtrain, 2, function(x){scale(as.numeric(x))}))
xtest = as.data.frame(apply(xtest, 2, function(x){scale(as.numeric(x))}))

set.seed(1)
library(class)
previsoes = class::knn(xtrain, xtest, cl = ytrain, k = 5)

library(caret)
caret::confusionMatrix(table(ytest, previsoes))
