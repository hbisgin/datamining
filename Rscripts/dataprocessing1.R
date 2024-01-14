library(ggplot2)
library(ggbiplot)
diabetes = read.delim("Documents/TEACHING/CSC487_587/data/diabetes_train.csv", sep=',', header = T)
#work with skin and mass. Remove skin==0
diabetes = subset(diabetes, skin!=0)

#compute correlation
cor(diabetes$skin, diabetes$mass)

#scatter plot with trend line
ggplot(diabetes, aes(x=skin, y=mass)) + geom_point(aes(colour=class)) + geom_smooth(method = 'lm')

#skin mass linear regression
mass = diabetes$mass
skin = diabetes$skin
smlm = lm(mass~skin)
#smlm = lm(diabetes$mass~diabetes$skin)
summary(smlm)
massp = predict.lm(smlm, newdata = data.frame(skin=skin[1:5]))

#PCA
diabskinage  = diabetes[, c("skin", "age")]
plot(diabskinage)

plot(prcomp(diabskinage))
biplot(prcomp(diabskinage))
ggbiplot(prcomp(diabskinage))

#get the eigen vectors or our new basis in new space
evectors = prsa$rotation

#coefficients for eigen vector
loadings = as.matrix(prsa$x)

#lets see if we can get the original data
loadings[1, ]%*%evectors

#recall that PCA started with mean centering, so this is the value we need to compare with
diabskinage[1, ] - colMeans(diabskinage)







