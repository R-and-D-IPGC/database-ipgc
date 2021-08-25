function(IBGE, ano){
  library(siconfir)
  for (i in IBGE){
    a <- get_annual_acc(year = ano, cod = as.numeric(i))
    print(a[which(a[,8] == "RO1.2.4.0.00.0.0" & a[,7] == "Receitas Brutas Realizadas"),c(1,2,7,10)])
  }
}
