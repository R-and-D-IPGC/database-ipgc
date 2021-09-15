for (i in c[,1]){
  print(i)
  A <- try(read.csv(paste("C:/Users/IPGC/Desktop/COFRE/SICONFI/2020/",i,"_BALANCOANUAL_2020.csv", sep = ""), sep = ","))
  n <-which(c[,1] == i)
  if (typeof(A) == "character"){
    A <- matrix(,nrow = 1, ncol = 11)
  }
  print("ok")
  B <- (A[which(A[,9] == "RO1.7.1.8.01.2.0" & A[,8] == "Receitas Brutas Realizadas"),c(11)])
  if (length(B) != 0){
    c[n,2] <- B
  }
  print("ok2")
  C <- (A[which(A[,9] == "RO1.2.4.0.00.0.0" & A[,8] == "Receitas Brutas Realizadas"),c(11)])
  if (length(C) != 0){
    c[n,3] <- C
  }
}

i = 1100155

