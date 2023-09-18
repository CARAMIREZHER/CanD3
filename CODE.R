install.packages("packrat")
library(packrat)

packrat::init("H:/Mi unidad/2023-I UdM/CanD3/TASK SEPT")
library(tidyverse)

#packrat::bundle()
#packrat::unbundle()

setwd("H:/Mi unidad/2023-I UdM/CanD3/TASK SEPT")
census <- read_csv("Canada_Census_1901_NWT.csv") 
glimpse(census)                
head(census)                  


census |> summary()          # summary() also get you a first overview of a newly
census |> count(relation_12)       # now we use count() to get a count of all unique values of the variable
census |> count(age_gr5)
census |> count(gender)

install.packages("descr")
library(descr)
library(ggplot2)

crosstab(census$gender, census$age_gr5 )

g2 <- ggplot(data = census, mapping = aes(x = census$residenceage))
g2 + geom_histogram()

hist(census$residenceage)
# Plotting two variables --------------------------------------------------

# Two variables, continuous values
# here: Life Expectancy and Gross National Income per Capita
g3 <- ggplot(census, mapping = aes(x = residenceage, y = age_gr5 ))

# scatter plot
g3 +
  geom_point()

# scatter plot with 2 regression lines 
g3 +
  geom_point() +
  # use linear regression line smoothing
  geom_smooth(method = "lm") + # use linear regression model
  # use default smoothing method, but do not show standard errors
  geom_smooth(se = FALSE) # default is general additive model


