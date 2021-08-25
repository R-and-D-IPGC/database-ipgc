ogrListLayers("C:/Users/jpfle/Desktop/BDGD/2019-12-31/CEMIG-D_4950_2019-12-31_M10_20200403-2018.gdb")
a <- readOGR("C:/Users/jpfle/Desktop/BDGD/2019-12-31/CEMIG-D_4950_2019-12-31_M10_20200403-2018.gdb", "PONNOT")
b <- coordinates(a)
c <- data.frame(a)
c[,c(length(c) + 1, length(c) + 2)] <- b

A <- data.frame(readOGR("C:/Users/jpfle/Desktop/BDGD/2019-12-31/CEMIG-D_4950_2019-12-31_M10_20200403-2018.gdb", "UNTRS"))
list.dirs("C:/Users/jpfle/Desktop/BDGD/2019-12-31")






#abre as layers do tipo y de 2019, transforma elas em dataframe e junta todas em um só documento
JUNTA_DIST_2019 <- function(y){
  library(rgdal)
  LISTA <- matrix(,ncol = length(colnames(data.frame(readOGR(list.dirs("C:/Users/jpfle/Desktop/BDGD/2019-12-31")[2], y)))))
  colnames(LISTA) <- colnames(data.frame(readOGR(list.dirs("C:/Users/jpfle/Desktop/BDGD/2019-12-31")[2], y)))
  for (i in length(list.dirs("C:/Users/jpfle/Desktop/BDGD/2019-12-31"))){
    if (i != 1){
      A <- data.frame(readOGR(list.dirs("C:/Users/jpfle/Desktop/BDGD/2019-12-31")[i], y))
      LISTA <- rbind(LISTA, A)
    }
  }
}





#gera arquivos de relação distribuidoras, pontos IP desagregados e cód. ponto notavel
library(rgdal)
n = 1
ENDERECO <- list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019")
for (i in length(ENDERECO)){
  if (i != 1){
    print(paste("começando", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])))
          
    A <- data.frame(readOGR(ENDERECO)[i], "PIP")[,c("MUN","CLAS_SUB", "PN_CON")]
    B <- data.frame(readOGR(list.dirs(ENDERECO)[i], "UCBT_Tab"))
    B <- B[c(which(B[,"CLAS_SUB"] == "IP")),c("MUN","CLAS_SUB", "PN_CON")]
    C <- data.frame(readOGR(list.dirs(ENDERECO)[i], "UCMT_Tab"))
    c <- C[c(which(C[,"CLAS_SUB"] == "IP")),c("MUN","CLAS_SUB", "PN_CON")]
    A <- rbind(A, B, C)
    write.csv(A, paste("C:/Users/IPGC/Desktop/IPGC/FINAL/ANEEL/IP_DESAGREGADO/2019/", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i]), ".csv", sep = ""))
    #gera arquivo de número de IP por código IBGE
    print(paste("arquivo criado", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])))
    
    for (y in unique(A$MUN)){
      LISTA[n,1] <- y
      LISTA[n,2] <- length(which(A$MUN == y))
      n = n + 1
    print(paste("finalizado", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i]), i, "/", length(ENDERECO)))
      
    }
  }
}


ENDERECO <- list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019")
for (i in seq(8,length(ENDERECO))){
  print(i)
  if (i != 1){
    if (i == 2){
      print(paste("começando", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])))
      a <- data.frame(readOGR(ENDERECO[i], "UNTRS"))
      print(paste("finalizado", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])))
    }
    if (i > 2 & "UNTRS" %in% ogrListLayers(ENDERECO[i])){
      print(paste("começando", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])))
      a <- rbind(a, data.frame(readOGR(ENDERECO[i], "UNTRS")))
      print(paste("finalizado", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])))
    }
  }
}

ogrListLayers(ENDERECO)






