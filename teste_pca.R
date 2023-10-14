library(factoextra)
library(stats)

source('pre_processamento.R')

res.pca = stats::prcomp(x_credit_treinamento[,-4], scale. = TRUE)
factoextra::fviz_contrib(X = res.pca, choice = 'var')

factoextra::fviz_pca_ind(res.pca,
    col.ind = ifelse(x_credit_treinamento$default == 1, 'Não pagam', 'Pagam')
)

treinamento_pca = res.pca$x[,c(1,2)]

library(randomForest)
set.seed(1)
rf = randomForest::randomForest(x = treinamento_pca, y = x_credit_treinamento$default, ntree = 100)

test_pca = predict(res.pca, newdata = x_credit_teste[, -4])[,c(1,2)]
predictions = predict(rf, newdata = test_pca)

library(caret)
caret::confusionMatrix(table(x_credit_teste$default, predictions))
