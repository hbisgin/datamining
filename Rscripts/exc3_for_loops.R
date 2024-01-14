#FOR LOOPS

fib <- numeric(13)
fib[1] <- 1
fib[2] <- 1

for(j in 3:13) {
  fib[j] <- fib[j-1] + fib[j-2]
}


vc=c("john", "mary", "adam")

for (item in vc)
{
  print(item)
}
