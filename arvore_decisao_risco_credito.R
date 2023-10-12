base = read.csv('risco_credito.csv')
library(rpart)
library(rpart.plot)

classificador = rpart(formula = risco ~ ., data = base, control = rpart.control(minbucket = 1))
print(classificador)
plot(classificador)
text(classificador)

rpart.plot(classificador)

# testando o modelo
df = data.frame(
  historia = c('boa', 'ruim'),
  divida = c('alta', 'alta'),
  garantias = c('nenhuma', 'adequada'),
  renda = c('acima_35', '0_15')
)


previsoes = predict(classificador, newdata = df)
previsoes
