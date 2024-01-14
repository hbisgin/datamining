library(clustertend)
x<-matrix(runif(200,1,100),50,4)
print(hopkins(x,n=5))
