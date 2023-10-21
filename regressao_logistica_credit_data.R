source('pre_processamento.R')

classifier = glm(formula = default ~ ., family = binomial, data = x_credit_treinamento)
probs = predict(classifier, type = 'response', newdata = x_credit_teste)
previsions = ifelse(probs >= 0.5, 1, 0) 

library(caret)
caret::confusionMatrix(table(ytest, previsions))
