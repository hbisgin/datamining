#median
L1=21
freqmed=1500
N=200+450+300+1500+700+44
freql=200+450+300
#+1500+700+44
width=50-21

mymedian=L1+ (N/2-freql)*width/freqmed
print(mymedian)

#normal distn
x=0
sigma=1
mu=0
p=(1/(sigma*sqrt(2*pi)))*exp(-0.5*((x-mu)/sigma)^2)
print(p)
dnorm(x)

#boxplot
boxplot(diabetes$plas)

#density
d<-density(diabetes$age)
plot(d, main="age distn")
polygon(d, col="red", border="blue")

##QQ plot
set.seed(183)
# Normally distributed numbers
x <- rnorm(80, mean=50, sd=5)
# Uniformly distributed numbers
z <- runif(80)

#long route:
n = max(length(x), length(y))
p = (1:n - 1)/(n - 1)
qx = quantile(x, p)
qz = quantile(z, p)
plot(qx,qz)

#Compare two distributions
qqplot(x,z)

#Compare the numbers sampled with rnorm() against normal distribution
qqnorm(x)
qqline(x)

#The same numbers to the 4th power, compared to the normal distribution
qqnorm(x^4)
qqline(x^4)

#Numbers sampled from the flat distribution, compared to normal
qqnorm(z)
qqline(z)

#toy=c(1.3, 2.2, 2.7, 3.1, 3.3, 3.7)

pairs(diabetes[,1:4]) #you can add more to see all pairs
p<-ggplot(diabetes, aes(x=age, y=mass)) + geom_point()
show(p)

q<-ggplot(diabetes, aes(x=age, y=mass)) + geom_point(aes(colour=class)) + facet_grid(class~.)
show(q)

p<-ggplot(diabetes, aes(x=age, y=mass)) + geom_point(stat='qq')
show(p)

library(lattice)
parallelplot(~iris[1:4] | Species, data = iris)
# 

#minkowski distance, as h->infinity, what happens?
x=c(1,1,3)
y=c(0,2,6)
for (h in 1:100)
{
  d=(sum(abs(x[1]-y[1])^h + abs(x[2]-y[2])^h + abs(x[3]-y[3])^h))^(1/h)
  print(d)
}


