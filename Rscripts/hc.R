distc = read.delim('~/Documents/TEACHING/CSC487_587/data/distances.csv', header = T, sep=',', row.names = 1)
distc = as.dist(distc) #casting from df to dist

hc = hclust(distc, method='single') #you can change the method to another one
plot(hc)

plot(hc, hang = -1)


clusters = cutree(hc, k=4)

