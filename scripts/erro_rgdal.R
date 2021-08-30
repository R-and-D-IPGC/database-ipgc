ENDERECO <- list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019")
#sequencia para UNTRS
c <- c(1,4,5,7,12,13,14,16,17,18,19,20,21,25,26,29,31,32,36,45,46,53,55,62,63,84)
#sequencia para SUB
c <- c(1,4,5,7,12,13,14,16,17,18,19,20,21,25,26,31,32,36,45,53,55,62)


library(sidrar)
d <- get_sidra(6579, geo = c("City", "MicroRegion"))
library(rgdal)
#junta UNTRS
for (i in seq(1,length(ENDERECO))){
  # if (i %in% c){
  #   print(paste("pulando", i))
  # } else {
    if (i == 2){
      print(paste("começando", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i]), as.character(i)))
      a <- data.frame(readOGR(ENDERECO[i], "UNTRS"))
      a[,length(a)+1] = (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])
      print(paste("finalizado", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])))
    }
    if (i > 2){
      print(paste("começando", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])))
      b <- data.frame(readOGR(ENDERECO[i], "UNTRS"))
      b[,length(b)+1] = (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])
      a <- rbind(a, b)
      print(paste("finalizado", (list.dirs("C:/Users/IPGC/Desktop/ANEEL DESCOMPACTADO/2019",full.names = FALSE)[i])))
    }
  # }
}
