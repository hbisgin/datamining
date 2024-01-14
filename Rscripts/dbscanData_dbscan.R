library(dbscan)
plot(NA, xlim=c(-10,10), ylim=c(-10,10))


r=5
x<-vector("numeric")
y<-vector("numeric")

for (theta in seq(0,360,1))
{
  x=rbind(x, r*cos(theta*pi/180))
  y=rbind(y, r*sin(theta*pi/180))
  
}

r=1

for (theta in seq(0,360,1))
{
  x=rbind(x, r*cos(theta*pi/180))
  y=rbind(y, r*sin(theta*pi/180))
  
}

points(x,y)

dbscantoy = data.frame(x=x,y=y)
clusters = dbscan(dbscantoy, eps = 1, minPts = 4)
print(clusters)
points(x,y, col=clusters$cluster)
