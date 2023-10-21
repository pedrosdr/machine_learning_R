base0 = read.csv('risco_credito.csv')
base0 = subset(base0, risco != 'moderado')
base = base0

base$risco = factor(base$risco)

classificador = glm(formula = risco ~ ., family = binomial, data = base)

xtest = data.frame(
  historia = c('boa', 'ruim'),
  divida = c('alta', 'alta'),
  garantias = c('nenhuma', 'adequada'),
  renda = c('acima_35', '0_15')
)

probs = predict(classificador, type = 'response', newdata = xtest)
previsoes = ifelse(probs >= 0.5, 'baixo', 'alto')
