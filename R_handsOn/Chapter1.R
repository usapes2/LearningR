library("ggplot2") 
die<-1:6
args(sample) # to get the arguments of the equation
sample(x = die, replace = TRUE, size = 2)

# The function constructor
my_function <- function(){}

roll <- function(){
  die<-1:6
  sample(x = die, size = 2, replace = TRUE)
}

  roll2 <- function(bones = 1:6) {
    dice <- sample(bones, size = 2, replace = TRUE)
    sum(dice)
  }
  
  roll3 <- function(){
    die<-1:6
    dice <-sample(x = die, size = 2, replace = TRUE,prob = c(1/8,1/8,1/8,1/8,1/8,3/8))
    sum(dice)
  }


# Examples of using quicplot qplot
  # Scatter Plot
  x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
  y <- exp(x)
  qplot(x,y)
  
  # Histogramms (qplot makes histograms when only single vector is provided as an argument)
  x <- c(1, 2, 2, 2, 3, 3,3,3,3,3,3)
  qplot(x, binwidth = 1)
  
  x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
  qplot(x2, binwidth = 1)

  x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
  qplot(x3, binwidth= 1)

  
  
# replicate function irst give replicate the number of times you wish to
# repeat an R command, and then give it the command you wish to repeat.  
  args(replicate)
  
  res <- replicate(1000000,roll3())
  qplot(res,binwidth = 1)
  
  