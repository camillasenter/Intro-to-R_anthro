### Anwesha Pan
### 10/03/2023
### Intro to R and R studio 


##set working directory 
setwd("//netid.washington.edu/csde/other/desktop/anweshap/Desktop")


## Installing R packages 
install.packages("ggplot2")
library(ggplot2)


# Generating sequence 
seq(from=1, to=5, by=1)
 

### R objects 
## Vectors, matrices, lists, dataframnes 

# create a vector
first_vec <- c(1, 3, 5)

# print 
first_vec

# create another vector
##Vectors
colors <- c("red", "blue", "green") #change colors
colors



# Generating list 
# creating a list of a numeric vector, an integer vector, and a character vector
mylist <- list(1.1, c(1,3,7), c("abc", "def"))
mylist



## Generating matrices
# create a 2x3 matrix, filling down columns
a <- matrix(1:6, nrow=2)
a
b <- matrix(5:14, nrow=2)
b
b1 <- matrix(5:14, nrow=2, byrow=TRUE)
b1
# generating 5x4 numeric matrix 
y<-matrix(1:20, nrow=5,ncol=4)
y


## Generating data frame 
mydata <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age    = c(42,38,26)
  )
mydata



# Some useful Functions

length(object) # number of elements or components
str(object)    # structure of an object 
class(object)  # class or type of an object
names(object)  # names

c(object,object,...)       # combine objects into a vector
cbind(object, object, ...) # combine objects as columns
rbind(object, object, ...) # combine objects as rows 

object     # prints the object

ls()       # list current objects
rm(object) # delete an object

newobject <- edit(object) # edit copy and save as newobject 

## Let's see how it works 
length(mydata)
str(mydata)
class(mydata)
names(mydata)

## list all objects in current session
ls()

# Delete "mylist" from the session 

rm(mylist)

# Now again list all objects in current session 
ls()




##Importing "bodyfat" file 
bodyfat <- read.csv("//netid.washington.edu/csde/other/desktop/anweshap/Desktop/bodyfat.csv", header=TRUE)

attach(bodyfat)
View(bodyfat)

## Glancing at "bodyfat" 
#Lets you look at the first few rows
head(bodyfat) 
head(bodyfat, 10)
#Lets you look at the last few rows
tail(bodyfat) 
tail(bodyfat, 10) 
#Lets you look at variable names
colnames(bodyfat) 

## Exploring continuous variables numerically

summary(bodyfat)

mean(bodyfat$age)
mean(bodyfat$age)
mean(bodyfat$weight)

median(bodyfat$age)

summary(bodyfat$age)
summary(bodyfat$weight)
summary(bodyfat$neckcircum)

#Calculates the Square Root of weight for each observation
wtsq <- sqrt(bodyfat$weight)
wtsq

#Calculates e raised of weight for each observation 
exp(bodyfat$weight)

#Calculates the logarithm of weight for each observation 
log(bodyfat$weight)


## Plotting the basic graphs 

## Let's create a barplot 
## Creating a categorical variable for age (categories are <=40, 40-50, > 50)
bodyfat$agectg <- cut(bodyfat$age, c(min(bodyfat$age), 40, 50, max(bodyfat$age)), include.lowest=TRUE)

## make the table for each category 
table(bodyfat$agectg)

## barplot for a categorical variable: this uses counts per category
barplot(table(bodyfat$agectg), main="Barplot of Age")

## Now let's create a histogram 
hist(bodyfat$weight)
hist(bodyfat$abdomencircum)

## Create a boxplot 
boxplot(bodyfat$weight)

boxplot(bodyfat$weight ~ bodyfat$agectg, main="Weight by age", ylab="weight")

## Making plot using the package ggplot2
ggplot(data = bodyfat, mapping = aes(x = agectg, y = weight)) +
  stat_boxplot(geom='errorbar', linetype=1, width=0.4) +
  geom_boxplot()


## Create a scatterplot 
plot(bodyfat$weight, bodyfat$age, main="weight by age", xlab="age", ylab="weight")


## Simple linear regression 
a1 <- lm(weight ~ age, data=bodyfat)
summary(a1)


## Test about proportions with two independent samples
## using tabulated data
tab <- matrix(c(26, 6, 24, 5), nrow=2, ncol=2, byrow=TRUE)

## let's see the result
tab

chisq.test(tab)
fisher.test(tab)

#Analysis of Variance (ANOVA)#
fit <- aov(bodyfat$weight ~ bodyfat$age)
fit


### Fun tasks 

### Create a data frame of four imaginary people containing gender, age, height, and weight. Then add a new variable BMI
### Import and read the estradiol data
### Estimate the summary statistics using the estradiol data 
### Estimate the mean and median of age of the participants in the dataset estradiol 
### Categorize the age of the paricipants from minimum age to 25, 25 to 30, and 30 to maximum age 
### Make a barplot of that categorical variable 
### Use ggplot2 to make a boxplot using that categorical variable and bmi (distribution of BMI in three age group)





#  More Help

# 1. http://cran.r-project.org/
# 2. Come in and talk to any of the Consultants
# 3. CSSS courses 
