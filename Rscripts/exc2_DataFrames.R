mtcars #built-in data set

mtcars[1, 2] #selecting a specific cell

mtcars["Mazda RX4", "cyl"] #selecting a specific cell

nrow(mtcars)    # number of data rows 
#[1] 32

#And the number of columns of a data frame is given by the ncol function.

ncol(mtcars)    # number of columns 
#[1] 11

#Instead of printing out the entire data frame, it is often desirable to preview it with the head function beforehand.

head(mtcars) 

#Data Frame Column Vector

 mtcars[[9]] 
#[1]  1 1 1 0 0 0 0 0 0 0 0 ...
#We can retrieve the same column vector by its name.

 mtcars[["am"]] 
#[1]  1 1 1 0 0 0 0 0 0 0 0 ...
#We can also retrieve with the "$" operator in lieu of the double square bracket operator.

 mtcars$am 
#[1]  1 1 1 0 0 0 0 0 0 0 0 ...
#Yet another way to retrieve the same column vector is to use the single square bracket "[]" operator. We prepend the column name with a comma character, which signals a wildcard match for the row position.

 mtcars[,"am"] 
#[1]  1 1 1 0 0 0 0 0 0 0 0 ...
 
 #Numeric Indexing
 #The following is a slice containing the first column of the built-in data set mtcars.
 
  mtcars[1] 
 # mpg 
 # Mazda RX4         21.0 
 # Mazda RX4 Wag     21.0 
 # Datsun 710        22.8 
 # ............
 
 #Name Indexing
 #We can retrieve the same column slice by its name.
 
  mtcars["mpg"] 
 # mpg 
 # Mazda RX4         21.0 
 # Mazda RX4 Wag     21.0 
 # Datsun 710        22.8 
 # ............
  
 #To retrieve a data frame slice with the two columns mpg and hp, 
 #we pack the column names in an index vector inside the single square bracket operator.
 
  mtcars[c("mpg", "hp")] 
 # mpg  hp 
 # Mazda RX4         21.0 110 
 # Mazda RX4 Wag     21.0 110 
 # Datsun 710        22.8  93 
  
  
  #Numeric Indexing
  #For example, the following retrieves a row record of the built-in data set mtcars. Please notice the extra comma in the square bracket operator, and it is not a typo. It states that the 1974 Camaro Z28 has a gas mileage of 13.3 miles per gallon, and an eight cylinder 245 horse power engine, ..., etc.
  
   mtcars[24,] 
  #mpg cyl disp  hp drat   wt  ... 
  #Camaro Z28 13.3   8  350 245 3.73 3.84  ...
  
  #To retrieve more than one rows, we use a numeric index vector.
  
   mtcars[c(3, 24),] 
  # mpg cyl disp  hp drat   wt  ... 
  # Datsun 710 22.8   4  108  93 3.85 2.32  ... 
  # Camaro Z28 13.3   8  350 245 3.73 3.84  ...
  # Name Indexing
  
  #We can retrieve a row by its name.
  
   mtcars["Camaro Z28",] 
  # mpg cyl disp  hp drat   wt  ... 
  # Camaro Z28 13.3   8  350 245 3.73 3.84  ...
   
  # And we can pack the row names in an index vector in order to retrieve multiple rows.
  
   mtcars[c("Datsun 710", "Camaro Z28"),] 
  # mpg cyl disp  hp drat   wt  ... 
  # Datsun 710 22.8   4  108  93 3.85 2.32  ... 
  # Camaro Z28 13.3   8  350 245 3.73 3.84  ...
   
  # Logical Indexing
  # Lastly, we can retrieve rows with a logical index vector. In the following vector L, 
  #the member value is TRUE if the car has automatic transmission, and FALSE if otherwise.
   
   L = mtcars$am == 0 
   L 
  # [1]   FALSE FALSE FALSE  TRUE ...
   
  # Here is the list of vehicles with automatic transmission.
   mtcars[L,] 
  # mpg cyl  disp  hp drat    wt  ... 
  # Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215  ... 
  # Hornet Sportabout   18.7   8 360.0 175 3.15 3.440  ... 
  # ............
   
  # And here is the gas mileage data for automatic transmission.
  
   mtcars[L,]$mpg 
  # [1] 21.4 18.7 18.1 14.3 24.4 ...
   
   
   #Working Directory
   #Finally, the code samples above assume the data files are located in the R working directory, which can be found with the function getwd.
   
    getwd()               # get current working directory
   #You can select a different working directory with the function setwd(), and thus avoid entering the full path of the data files.
   
   setwd("<new path>")   # set working directory
   #Note that the forward slash should be used as the path separator even on Windows platform.
   
   setwd("C:/MyDoc")
   