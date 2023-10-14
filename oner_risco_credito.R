base = read.csv('risco_credito.csv')

library(OneR)
classificador = OneR(x = base)

df = data.frame(
  historia = c('boa', 'ruim'),
  divida = c('alta', 'alta'),
  garantias = c('nenhuma', 'adequada'),
  renda = c('acima_35', '0_15')
)

predict(classificador, newdata = df)
