#question 1
#x=rnorm(20)
#mean(x) 


diabetes = read.delim('~/Documents/TEACHING/CSC487_587/data/diabetes_train.csv', header = T, sep=',')


d<-density(diabetes$age)
plot(d, main="age distn")
#polygon(d, col="red", border="blue")

kcluster = kmeans(diabetes[,-9], 2) # kmean clustering 


table(diabetes$class,  kcluster$cluster)

plot(diabetes[c('plas', 'mass')], col=kcluster$cluster) #col means coloring
#*************iris data with k-means**********************************

(kmeans.result <- kmeans(iris[, -5], 3))
table(iris$Species, kmeans.result$cluster) #class labels vs. cluster ids

plot(iris[c("Sepal.Length", "Petal.Width")], col = kmeans.result$cluster)

points(kmeans.result$centers[, c("Sepal.Length", "Sepal.Width")],
        col = 1:3, pch = 8, cex = 2) # plot cluster centers

#***********iris data with k-medoid (PAM) ***************
library(cluster)
irpam = pam(iris[,-9],3)

table(iris$Species, irpam$clustering)

plot(iris$Sepal.Length, iris$Petal.Width, col=irpam$clustering)

points(irpam$medoids[,c('Sepal.Length', 'Petal.Width')], col=1:3, pch=5, cex=2)#medoids

#******************toy data
toy = read.delim('~/Documents/TEACHING/CSC487_587/data/kmedoid_data.csv',header=T, sep=',')
toypam = pam(toy,2)
plot(toy$x1, toy$x2, col=toypam$clustering)
points(toypam$medoids[, c('x1', 'x2')], col=1:2, pch=5, cex=2)


#*********************Let's Normalize diabetes**************************
diabetesnormed = matrix(0, nrow = nrow(diabetes), ncol = ncol(diabetes)-1)

for (i in 1:8)
{
  md = mean(diabetes[,i])
  stdd = sd(diabetes[,i])
  diabetesnormed[,i]=(diabetes[,i]-md)/stdd
}

kcluster = kmeans(diabetesnormed, 2)

table(diabetes$class,  kcluster$cluster)

table(diabetes[which(kcluster$cluster==1), 'class'])
table(diabetes[which(kcluster$cluster==2), 'class'])



kpam = pam(diabetesnormed, 2)
table(diabetes$class, kpam$clustering)
plot(diabetes[c('plas', 'mass')], col=kpam$clustering) #col means coloring

table(diabetes[which(kpam$clustering==1), 'class'])

table(diabetes[which(kpam$clustering==2), 'class'])

#diabetes[which(kpam$clustering==1), 'plabels']=1
#diabetes[which(kpam$clustering==2), 'plabels']=2