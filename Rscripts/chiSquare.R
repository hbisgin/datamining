chidf = data.frame(x=rchisq(100000, 1))
ggplot(chidf, aes(x=x)) + geom_density()


