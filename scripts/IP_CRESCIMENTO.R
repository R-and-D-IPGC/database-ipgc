QUADRO<- matrix(ncol = 6, nrow = 5570)
n = 1
i = 5
ibge <- read.csv("C:/Users/IPGC/Desktop/COFRE/SIDRA/TABELA6579_2021.csv", sep = ";")
for (y in unique(ibge[,6])){
  QUADRO[n,1] <- y
  n = n + 1}
colnames(QUADRO) <- c("MUN", 2019, 2018, 2017, 2016, 2015)
A <- data.frame("MUN"=0,"CLAS_SUB"=0)

for (i in c(2019,2018,2017)){
  ENDERECO <- list.files(paste("C:/Users/IPGC/Desktop/ANEEL CONVERTIDO/",as.character(i),sep = ""), full.names = FALSE)
  A <- data.frame("MUN"=0,"CLAS_SUB"=0)
  for (y in seq(1,length(list.files(paste("C:/Users/IPGC/Desktop/ANEEL CONVERTIDO/",as.character(i),sep = ""))))){
    if ("PIP.csv" %in% list.files(paste("C:/Users/IPGC/Desktop/ANEEL CONVERTIDO/", as.character(i),"/",ENDERECO[y],sep = ""))){
      a <- read.csv(paste("C:/Users/IPGC/Desktop/ANEEL CONVERTIDO/", as.character(i),"/",ENDERECO[y],"/PIP.csv",sep = ""))[,c("MUN", "CLAS_SUB")]

      A <- rbind(A,a)
      print(ENDERECO[y])
    }
  }
  for (y in seq(1,length(QUADRO[,1]))){
    QUADRO[y,as.character(i)] <- length(which(A[,1] == QUADRO[y,1]))
  }
  write.table(QUADRO, "C:/Users/IPGC/Desktop/IPGC/FINAL/IP_CRESCIMENTO_V2.csv", sep = ";", row.names = FALSE)
}



for (i in c(2016,2015)){
  ENDERECO <- list.files(paste("C:/Users/IPGC/Desktop/ANEEL CONVERTIDO/",as.character(i),sep = ""), full.names = FALSE)
  for (y in seq(1,length(list.files(paste("C:/Users/IPGC/Desktop/ANEEL CONVERTIDO/",as.character(i),sep = ""))))){
    if(c("UC_BT_tab.csv", "UC_MT_tab.csv") %in% list.files(paste("C:/Users/IPGC/Desktop/ANEEL CONVERTIDO/",as.character(i),"/",ENDERECO[y],sep = ""))){
      b <- read.csv(paste("C:/Users/IPGC/Desktop/ANEEL CONVERTIDO/", as.character(i),"/",ENDERECO[y],"/UC_BT_tab.csv",sep = ""))[,c("RAMAL", "CLAS_SUB")]
      b <- b[which(b$CLAS_SUB == "IP"),]
      c <- read.csv(paste("C:/Users/IPGC/Desktop/ANEEL CONVERTIDO/", as.character(i),"/",ENDERECO[y],"/UC_BT_tab.csv",sep = ""))[,c("RAMAL", "CLAS_SUB")]
      c <- c[which(c$CLAS_SUB == "IP"),]
      A <- rbind(b,c)
    }
  }
  for (y in seq(1,length(QUADRO$MUN))){
    QUADRO[y,as.character(i)] <- length(which(A[,1] == QUADRO[y,1]))
  }
  write.table(QUADRO, "C:/Users/IPGC/Desktop/IPGC/FINAL/IP_CRESCIMENTO_pt4.csv", sep = ";", row.names = FALSE)
}

