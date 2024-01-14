v <- c(1.6, 2.1, 1.5, 1.9)
names(v) <- c("S1", "S2", "S3", "S4")
v

length(v)

names(v) <- NULL
v

## [1] 1.6 2.1 1.5 1.9
#An integer vector is a special type of numeric vector. It’s easy to form ranges of integers like

j <- 2:6
j
## [1] 2 3 4 5 6
#You can fetch the mode of a vector with mode or class.

mode(v)
## [1] "numeric"
class(v)
## [1] "numeric"

#Characters
s <- c("a", "BBB", "TCGA", "1", "2.1")
length(s)
## [1] 5
length("BBB")
## [1] 1
nchar("BBB")
## [1] 3
mode(c(3, 2))
## [1] "numeric"
mode(c("3", "2"))
## [1] "character"
x2 <- as.numeric(c("3", "2"))
x2
## [1] 3 2
mode(x2)
## [1] "numeric"

#Logical vectors
#A logical vector is just a sequence of TRUE and FALSE instances.

lv <- c(TRUE, FALSE, TRUE)
#Trick: sum can count the number of TRUE values in a logical vector.

sum(lv)
## [1] 2

#Comparisons
#Logical vectors arise from comparisons, normally equality, <, >, %in%, etc. These comparisons replicate across vectors.

1 < 2
## [1] TRUE
c(0, 1, 3) < 2
## [1]  TRUE  TRUE FALSE
c(0, 1, 3) == 1
## [1] FALSE  TRUE FALSE
c(0, 1, 3) != 1
## [1]  TRUE FALSE  TRUE
0 %in% c(0, 1, 3)
## [1] TRUE
c(0, 2) %in% c(0, 1, 3)
## [1]  TRUE FALSE

#Comparison expressions can be strung into compound formulas using & (and) and | (or).


#Restricting and subsetting vectors
#Positive integer vectors select elements from vector by index. Negative integers remove the corresponding elements.

v <- sample(1:100, size=25)
v[15:19]
## [1] 25 91 89 57 27

v[25]
## [1] 42

v[ -(3:25)]
## [1] 18 78

#You can also select using the names attributes.

y <- rnorm(10)
names(y) <- paste("S", 1:10, sep="")
y
##       S1       S2       S3       S4       S5       S6       S7       S8 
##  1.42428  1.12152 -0.91293  0.71342  0.13954  0.07554 -0.51438 -0.41640 
##       S9      S10 
##  1.61927  0.37486

y["S1"]

##    S1 
## 1.424

y[c("S2", "S4")]

##     S2     S4 
## 1.1215 0.7134

#Subsetting with a logical vector
#Putting a logical vector of the same length inside the [ ] forms a subvector consisting of those entries where it’s true.

a <- c("w", "XX", "z", "fractal")
ll <- c(TRUE, FALSE, FALSE, TRUE)
a[ll]
## [1] "w"       "fractal"
length(a[ll])
## [1] 2
#This allows us to use comparison relations to select sequences.

# First write an expression to select "XX" from a
a == "XX"
## [1] FALSE  TRUE FALSE FALSE
# Use this to subset a
a[a == "XX"]
## [1] "XX"

#Missing data
#Having missing values in a vector, which are recorded as NA, can complicate the application of functions and comparisons with the vector.

z1 <- c(1,1,2, 4, 5, NA, NA)
z1 == NA
## [1] NA NA NA NA NA NA NA
# R has a special function for identifying missing values
is.na(z1)
## [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
!is.na(z1)
## [1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
sum(is.na(z1))
## [1] 2
#Missing values complicate comparisons and subsetting too.

z1 == 1
## [1]  TRUE  TRUE FALSE FALSE FALSE    NA    NA
z1[z1 == 1]
## [1]  1  1 NA NA
z1[z1 == 1 & !is.na(z1)]
## [1] 1 1
#So, I got 2 more elements than I wanted, because the mising values could be 1.

#How do I get only the 1’s?

#na.rm option
#Let’s return to v2. How do we find the sum of the values that aren’t missing? We could subset and then sum the resulting vector, but R has a quicker solution. Look up the help for sum and solve the problem.

#Assignment to subvectors
#It may be necessary to to assign new values to entries in a vector. This may be true for individual entries and for subvectors. Such assignments are similar to subsetting but the square bracket is on the left side of a <- .

#To assign to individual entries:
  
  y
##       S1       S2       S3       S4       S5       S6       S7       S8 
##  1.42428  1.12152 -0.91293  0.71342  0.13954  0.07554 -0.51438 -0.41640 
##       S9      S10 
##  1.61927  0.37486
y[2] <- 5
y["S10"] <- 0
y
##       S1       S2       S3       S4       S5       S6       S7       S8 
##  1.42428  5.00000 -0.91293  0.71342  0.13954  0.07554 -0.51438 -0.41640 
##       S9      S10 
##  1.61927  0.00000
#You can assign a single value or sequence to a range of entries.

y[1:3] <- 1
y
##       S1       S2       S3       S4       S5       S6       S7       S8 
##  1.00000  1.00000  1.00000  0.71342  0.13954  0.07554 -0.51438 -0.41640 
##       S9      S10 
##  1.61927  0.00000
y[1:3] <- c(0, -1, 2)
y
##       S1       S2       S3       S4       S5       S6       S7       S8 
##  0.00000 -1.00000  2.00000  0.71342  0.13954  0.07554 -0.51438 -0.41640 
##       S9      S10 
##  1.61927  0.00000
#A logical vector can also be used to select the subsequent that takes the assignment. Predictably, the TRUE values of the vector within the [ ] define the subsequence.

x3 <- c("a", "b", "Xi", "mu")
sel <- c(FALSE, FALSE, TRUE, TRUE)
x3[sel] <- c("x", "m")
x3
## [1] "a" "b" "x" "m"
#As with subsetting, the logical vector usually comes from an equation or inequality.

w <- rt(6, df=4) # get 6 random values from a t-distribution with 4 degrees of freedom
w
## [1]  0.7361 -0.7362  0.2922 -0.7701  0.7645  2.0576
w[w > median(w)] <- 20
w
## [1] 20.0000 -0.7362  0.2922 -0.7701 20.0000 20.0000

#Factors
#A factor is a type of character vector for which the possible values are set by the context. For a factor describing gender the two possibilities are “M” and “F”. The extra structure offered by the factor class helps in some statistical modeling and data management. Start with a character vector.

c1 <- c(rep("A", times = 5), rep("B", times=8))
c1
##  [1] "A" "A" "A" "A" "A" "B" "B" "B" "B" "B" "B" "B" "B"
f1 <- factor(c1)
f1
##  [1] A A A A A B B B B B B B B
## Levels: A B
levels(f1)
## [1] "A" "B"
c1[1:4]
## [1] "A" "A" "A" "A"
f1[1:4]
## [1] A A A A
## Levels: A B
f2 <- factor(c("A", "C", "B", "D", "D")) 
c(f1, f2)
##  [1] 1 1 1 1 1 2 2 2 2 2 2 2 2 1 3 2 4 4
c(as.character(f1), as.character(f2))
##  [1] "A" "A" "A" "A" "A" "B" "B" "B" "B" "B" "B" "B" "B" "A" "C" "B" "D"
## [18] "D"
factor(c(as.character(f1), as.character(f2)))
##  [1] A A A A A B B B B B B B B A C B D D
## Levels: A B C D
f3 <- factor(c("A", "B", "B"))
c(f1, f3)
##  [1] 1 1 1 1 1 2 2 2 2 2 2 2 2 1 2 2
f1
##  [1] A A A A A B B B B B B B B
## Levels: A B
c4 <- c("X", "X", "Y", "Y", "Y")
f4 <- factor(c4, levels=c("X", "Y"), ordered=T)
f4
## [1] X X Y Y Y
## Levels: X < Y
x <- factor(c(0, 0, 1, 1,1))
x
## [1] 0 0 1 1 1
## Levels: 0 1
as.integer(x)
## [1] 1 1 2 2 2
as.integer(as.character(x))
## [1] 0 0 1 1 1


#Lists
#Much of your time in large scale projects will be spent managing lists and data.frames (which are also lists). A list is an indexed collection of R objects. What an index points to is called a component of the list. It’s like a vector but you can put anything in a component. Like a vector a list can contain names for the components.

aa <- list(c(1,2), c("z", "ALN"), c(1,2, 3.4, 5.6))
class(aa)
## [1] "list"
length(aa)
## [1] 3
names(aa)
## NULL
names(aa) <- c("V1", "V2", "V3")
# A quicker way to initialize with names
bb <- list(V1 = c("a", "1"), V2 = c(2,2,2))
bb
## $V1
## [1] "a" "1"
## 
## $V2
## [1] 2 2 2
#Indexing a list
#We have lots of nested indexing here? Keeping it clear is done with bracket level.

aa[[1]]
## [1] 1 2
bb$V1
## [1] "a" "1"
bb[["V1"]]
## [1] "a" "1"
class(aa[[1]])
## [1] "numeric"
#This gives the first component, as an object of it’s own class. The list structure is gone.

aa[1]
## $V1
## [1] 1 2
class(aa[1])
## [1] "list"
#This is a list of length 1.

#To get sublists in general, do what you’d do for a vector.

aa[2:3]
## $V2
## [1] "z"   "ALN"
## 
## $V3
## [1] 1.0 2.0 3.4 5.6
#A double bracket range gives an error.
