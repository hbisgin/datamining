library(ggplot2)

mu = colMeans(USArrests)
USArrestspca = prcomp(USArrests)

nComp = 4
USArrestshat = USArrestspca$x[,1:nComp] %*% t(USArrestspca$rotation[,1:nComp])
USArrestshat = scale(USArrestshat, center = -mu, scale = FALSE)

plot(prcomp(USArrests, scale. = TRUE))

#before PCA
ggplot(data=iris, aes(x=iris[, 1], y=iris[,2], color=iris$Species)) + geom_point()

irispca = princomp(iris[, 1:4])

irispca_df = as.data.frame(irispca$scores)

#after PCA
ggplot(data=irispca_df, aes(x=irispca_df[,1], y=irispca_df[, 2], color=iris$Species) ) + geom_point()




