set.seed(123)
v <- sample(x = -10:10, size = 12)
M1 <- matrix(v, nrow=4)
M1

#1. Problem Compute the mean values of each row.

#First, use a loop.

row_means <- rep(NA, times = nrow(M1))

for(j in 1:nrow(M1)) {
  row_means[j] <- mean(M1[j,])
}
row_means

r_means <- apply(M1, 1, mean)

#2. We’ll use variance, although interquartile range (IQR) is another common option.
data= read.delim("~/Documents/TEACHING/Data_Science/R/data/Su_raw_matrix.txt")
expr_mat <- data[c(1,2,3), ]
row_vars <- apply(expr_mat, 1, var)
#Here is the loop method.

r_vars <- numeric(nrow(expr_mat))
for(j in 1:nrow(expr_mat)) {
  r_vars[j] <- var(as.numeric(expr_mat[j,]))
}

#3. Problem For each sample, identify a gene with maximal expression in that sample, and return the gene id.

#First define the function that does the work.

sel_max <- function(v) {
  names(v) <- rownames(data)
  print(class(v))
  v2 <- sort(v, decreasing=T)
  w <- names(v2)[1]
  w
}

maximas <- apply(data, 2, sel_max)
maximas[1:3]
