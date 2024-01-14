# File-Name:       chapter02.R           
# Date:            2011-11-11                                
# Author:          John Myles White
# Email:           jmw@johnmyleswhite.com
# Purpose:         Code for Chapter 2. Showcases tools for exploratory data analysis.
# Data Used:       data/01_heights_weights_genders.csv
# Packages Used:   ggplot2
# Machine:         John Myles White's MacBook

# All source code is copyright (c) 2011, under the Simplified BSD License.  
# For more information on FreeBSD see: http://www.opensource.org/licenses/bsd-license.php

# All images and materials produced by this code are licensed under the Creative Commons 
# Attribution-Share Alike 3.0 United States License: http://creativecommons.org/licenses/by-sa/3.0/us/

# All rights reserved.

#
# Snippet 1
#

# Load in the data set from disk.
data.file <- file.path('../data', '01_heights_weights_genders.csv')
heights.weights <- read.csv(data.file, header = TRUE, sep = ',')

# Create a numeric vector containing just the heights data.
heights <- with(heights.weights, Height)
summary(heights)


# Experiment with functions for assessing the range of a data set.
min(heights)
#[1] 54.26313

#
# Snippet 6
#

max(heights)
#[1] 78.99874

#
# Snippet 7
#

c(min(heights), max(heights))
#[1] 54.26313 78.99874

range(heights)
#[1] 54.26313 78.99874

#
# Snippet 8
#

# Try out the quantile function for computing arbitrary quantiles.
quantile(heights)
#      0%      25%      50%      75%     100% 
#54.26313 63.50562 66.31807 69.17426 78.99874 

#
# Snippet 9
#

quantile(heights, probs = seq(0, 1, by = 0.20))
#      0%      20%      40%      60%      80%     100% 
#54.26313 62.85901 65.19422 67.43537 69.81162 78.99874 

#
# Snippet 10
#

seq(0, 1, by = 0.20)
#[1] 0.0 0.2 0.4 0.6 0.8 1.0

#
# Snippet 11
#



# Start visualizing data using the ggplot2 package.
library('ggplot2')

# Load the data from scratch for purity.
data.file <- file.path('data', '01_heights_weights_genders.csv')
heights.weights <- read.csv(data.file, header = TRUE, sep = ',')

# Experiment with histograms.
ggplot(heights.weights, aes(x = Height)) +
  geom_histogram(binwidth = 1)

#
# Snippet 21
#

ggplot(heights.weights, aes(x = Height)) +
  geom_histogram(binwidth = 5)

#
# Snippet 22
#

ggplot(heights.weights, aes(x = Height)) +
  geom_histogram(binwidth = 0.01)

#
# Snippet 23
#

# Experiment with kernel density estimates.
ggplot(heights.weights, aes(x = Height)) +
  geom_density()

#
# Snippet 24
#

# Separate out heights and weights based on gender.
ggplot(heights.weights, aes(x = Height, fill = Gender)) +
  geom_density()

#
# Snippet 25
#

ggplot(heights.weights, aes(x = Weight, fill = Gender)) +
  geom_density()

#
# Snippet 26
#

# Produce two facets in a single plot to make it easier to see the hidden structure.
ggplot(heights.weights, aes(x = Weight, fill = Gender)) +
  geom_density() +
  facet_grid(Gender ~ .)

#
# Snippet 27
#

# Experiment with random numbers from the normal distribution.
m <- 0
s <- 1
ggplot(data.frame(X = rnorm(100000, m, s)), aes(x = X)) +
  geom_density()

#
# Snippet 28
#


#

# Generate scatterplots of the heights and weights to see their relationship.
ggplot(heights.weights, aes(x = Height, y = Weight)) +
  geom_point()

#
# Snippet 32
#

# Add a smooth shape that relates the two explicitly.
ggplot(heights.weights, aes(x = Height, y = Weight)) +
  geom_point() +
  geom_smooth()

#
# Snippet 33
#

# See how the smooth shape gets better with more data.
ggplot(heights.weights[1:20, ], aes(x = Height, y = Weight)) +
  geom_point() +
  geom_smooth()
ggplot(heights.weights[1:200, ], aes(x = Height, y = Weight)) +
  geom_point() +
  geom_smooth()
ggplot(heights.weights[1:2000, ], aes(x = Height, y = Weight)) +
  geom_point() +
  geom_smooth()

#
# Snippet 34
#

# Visualize how gender depends on height and weight.
ggplot(heights.weights, aes(x = Height, y = Weight)) +
  geom_point(aes(color = Gender, alpha = 0.25)) +
  scale_alpha(guide = "none") + 
  scale_color_manual(values = c("Male" = "black", "Female" = "gray")) +
  theme_bw()

# An alternative using bright colors.
ggplot(heights.weights, aes(x = Height, y = Weight, color = Gender)) +
  geom_point()





