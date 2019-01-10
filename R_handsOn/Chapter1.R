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
  y <- x^2
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
  
  res <- replicate(100000,roll3())
  
  qplot(res,binwidth = 1)
  
# Chapter 2
  
# Attributes names, dim, classes
  # To look up the value of attributes
  names(res)
  dim(res)
  class(res)  
  typeof(res)
  attributes(res)
  
names(die) = c("one","two","three","four","five","six")
names(die)  
  attributes(die)
die  
  # To remove object attribute set it to NULL  
names(die) <-NULL
  attributes(die)  
die  
  # Set dimentions attributes feed the vector with dimentions
dim(die)<-c(2,3)
attributes(die)
dim(die)
  
  # Same is atchieved by using matrix command with a little more control
dim(die) <- NULL
die

matrix(die,nrow = 2) # fills the matrix by column 
die
matrix(die,nrow = 2, byrow = TRUE)
new <- matrix(die,nrow = 2, byrow = TRUE) 
names(new)<- c("one","two","three","four","five")
names(new) <- NULL
names(new)

mx <- matrix(c("ace","king","queen","jack","ten","spades","spades","spades","spades","spades"),ncol = 2)
mx

# Changing the dimention of an ojectect doesn't change it's type but does change its class
typeof(die)
class(die)
dim(die) <- c(2,3)
typeof(die)
class(die)
dim(die) <- NULL
die<-c(1,2,3,4,5,6)
typeof(die)

# Factor is a class used to track categorical data

gender <- factor(c("m","f","m","m"))
unclass(gender)
typeof(gender)
attributes(gender)

typeof(as.character(gender))

# Special card
typeof(c(1,1L,3L))

sp.card <- factor(c("ace","hearts",1))
sp.card

# Can convert into specific data form when there is a logical way to do this

as.character("1")
as.numeric(TRUE)
as.logical(FALSE)

# Lists can store any type of data 
card <- list ("ace","hearts",1)
typeof(card)
card[[1]]
card[[2]]



# Data frames are two dimentional version of  lists

df <- data.frame( face = c("ace","two","six"), suit = c("clubs","diamond","diamond"), value = c(1,2,3))
df

typeof(df)
class(df)
attributes(df)
str(df) # Created factors 

df <- data.frame(face = c("ace", "two", "six"),
                 suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3),
                 stringsAsFactors = FALSE)
# StringsAsFactors = False prevents R to declear ton's of factors
df



write.csv(tmp, file = "cards.csv", row.names = FALSE)
# row.names = FALSE no row numbers in the beginning
getwd()

# Chapter 4 R Notation

# Positive integers
# Negative integers
# Zero
# Blank spaces
# Logical values
# Names


str(deck)
head(deck)
deck[1,1]
deck[1,c(1,2,3)]
deck[1:12,c(1,2,3)]


typeof(deck[1:2,1,drop = F])
#use drop = F to keep it as data frame

deck[1:2,1,drop = F]


#Negative
#Negative integers do the exact opposite of positive integers when indexing. R will return
#every element except the elements in a negative index

deck[-(3:52),1]
deck[1:2,1]

# Blank Spaces
#  extract every value in a dimension.
deck[1,]
deck[1:3,]

# Logical Values

deck[1,c(TRUE,TRUE,FALSE)]
str(deck)

# Example with vector
vec<-c(11,12,13,14,15)
Shuffle<-sample(1:5,size=5,replace=FALSE)
Shuffle
# Shuffle the deck
random<- sample(1:52,size = 52, replace = FALSE)
deck4<-deck[random,]
head(deck4)

shuffle<-function(cards){
  random<- sample(1:52,size = 52, replace = FALSE)
  cards[random,]
}
deck<-shuffle(deck)

deal <- function(cards){
  cards[1,]
}
deal(deck)

# Dollar Signs and Double Brackets
#     Two types of object in R obey an optional second system of notation. You can extract
#     values from data frames and lists with the $ syntax |  write the data frame’s name and the column name
#     separated by a $

str(deck)
vec<-1:52
vec1<-vec[sample(c(TRUE,FALSE),size=52,replace=TRUE)]
length(vec1)

# When applied to lists
#When you use the $ notation, R will return the selected values as they are, with no list
# structure around them:

lst <-list(numbers = c(1,2), logical = TRUE, strings <- c("a","b","c"))
lst$numbers
sum(lst$numbers)

sum(lst[1])
# Note the error

#When you use single brackets, R selects individual train cars and
#returns them as a new train. Each car keeps its contents, but those contents are still
#inside a train car (i.e., a list). When you use double brackets, R actually unloads the car
#and gives you back the contents.

lst[1]
lst[[1]]

typeof(lst[1])
typeof(lst[[1]])

# Modifying Values

# You can replace multiple values at once as long as the number of new values equals the
# number of selected values:

vec <- c(1,2,3,4)
vec
vec[1:3] <- vec[1:3] + 1
vec

head(deck)

deck$new <- 1:52
head(deck)

deck[,2]
deck[,3]

# remove columns from a data frame (and elements from a list) by assigning
# them the symbol NULL 

str(deck)

deck$new<-NULL
str(deck)
# Subsetting

deck[c(13, 26, 39, 52), 3] # from data set
# Instead of 3'd column we can do this

deck$value[c(13,26,39,52)]

deck$value[c(13,26,39,52)] <-14
# or
deck$value[c(13,26,39,52)] <- c(14,14,14,14)

deck[deck$value == 14,]

# to look at the first ten entires head(deck,10)
deck3<-shuffle(deck)
head(deck3,10)


# Logical subsetting provides a way to do targeted extraction

vec <- c( 1,2,3,4,5)
vec[c(T,T,T,F,F)] # subsetting with logical operations

  #>    a > b Is a greater than b?
  #>=   a >= b Is a greater than or equal to b?
  #<    a < b Is a less than b?
  #<=   a <= b Is a less than or equal to b?
  #==   a == b Is a equal to b?
  #!=   a != b Is a not equal to b?
  #%in% a %in% c(a, b, c) Is a in the group c(a, b, c)?

vec

vecBool <- (vec >1) # creates a vector
vecBool

#  %in% will independently test whether each
#value on the left is somewhere in the vector on the right

1 %in% c(3, 4, 5)
## FALSE
c(1, 2) %in% c(3, 4, 5)
## FALSE FALSE
c(1, 2, 3) %in% c(3, 4, 5)
## FALSE FALSE TRUE
c(1, 2, 3, 4) %in% c(3, 4, 5)
## FALSE FALSE TRUE TRUE

str(deck3)
sum(deck3$face =="ace")
deck3[deck3$face == "ace","value"]
deck3[deck3$face == "ace",3]
deck3$value[deck3$face == "ace" ]
deck3

# Assign a value of 1 to every card in deck4 that has a suit of hearts

deck3$value[deck3$suit == "hearts" ] <- 1
deck3$value[deck3$suit == "hearts"]

deck3[deck3$face == "queen",]


# Boolean Operators

#  &    cond1 & cond2 Are both cond1 and cond2 true?
#  |    cond1 pipe cond2 Is one or more of cond1 and cond2 true?
#  xor  xor(cond1, cond2) Is exactly one of cond1 and cond2 true?
#  !    !cond1 Is cond1 false? (e.g., ! flips the results of a logical test)
#  any  any(cond1, cond2, cond3, …) Are any of the conditions true?
#  all  all(cond1, cond2, cond3, …) Are all of the conditions true?

# Could you use a Boolean operator to locate the queen of spades in your deck?


deck[deck$face == "queen" & deck$suit == "spades",3]<-13

deck[deck$face == "queen" & deck$suit == "spades",]


# • Is w positive?
#  • Is x greater than 10 and less than 20?
#  • Is object y the word February?
#  • Is every value in z a day of the week?
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- "February"
z <- c("Monday", "Tuesday", "Friday")
w>0
y == "February"

all( z %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
              "Saturday", "Sunday"))

#In blackjack, each number card has a value equal
#to its face value. Each face card (king, queen, or jack) has a value of 10. Finally, each ace
#has a value of 11 or 1, depending on the final results of the game.

deck[deck$face %in% c("king","queen","jack"),3] <- 10
deck[deck$face %in% c("king","queen","jack"),]

head(deck,13)

deck[deck$face == "ace",3] <- 11
head (deck,20)



# Missing Information

mean(c(NA, 1:50))
mean(1:50)
mean(c(NA, 1:50),na.rm = TRUE) # Ignores rm's inside of the funciton


# Which means that tests like this won’t help you find missing values:
# c(1, 2, 3, NA) == NA

# R supplies a special function that can test whether a value is
# an NA . The function is sensibly named is.na :
# is.na(NA)
vec<-c(1,2,3,NA,5)
is.na(vec)

vec[is.na(vec)] <- 10000

# In blackjack ace's value depends on the hand
# lets set all ace's to NA to remind us that and deal with it at the end of the game

deck$value[deck$face == "ace"] <- NA

deck$value[deck$face == "ace"]
head(deck)
head(deck,13)


# Environments

library(devtools)
parenvs(all = TRUE) 
library(pryr)
parenvs(all = TRUE) 


as.environment("package:stats")

#Three environments in your tree also come with their own accessor functions. These
##are the global environment ( R_GlobalEnv ), the base environment ( base ), and the empty
#environment ( R_EmptyEnv ). You can refer to them with:
  globalenv()
## <environment: R_GlobalEnv>
baseenv()
## <environment: base>
emptyenv()
##<environment: R_EmptyEnv>


#you can look up an environment’s parent with parent.env :
  parent.env(globalenv())

# You can view the objects saved in an environment with ls or ls.str 
  ls(globalenv())
# You can use R’s $ syntax to access an object in a specific environment. For example, you
# can access deck from the global environment:
  head(globalenv()$deck, 3)

  
 # And you can use the assign function to save an object into a particular environment.
#  First give assign the name of the new object (as a character string). Then give assign
#  the value of the new object, and finally the environment to save the object in:
    assign("new", "Hello Global", envir = globalenv())
  globalenv()$new  

# The Active Enviroment
 # You can use environment to see the current active environment:
    environment()
# Scoping Rules

    # Every time R runs a function, it creates a new active environment to evaluate the function in.
    # Evaluation
  
    environment(deal)
    
    deal <- function() {
      card <- deck[1, ]
      assign("deck", deck[-1, ], envir = globalenv())
      card
    }

    deal()
str(deck)  

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}

DECK <-deck

shuffle <- function() {
  indx <- sample(1:52,size = 52, replace = FALSE)
  assign("deck", DECK[indx, ], envir = globalenv())
}

deal()
shuffle()
# Closures

setup <- function(deck) {
  DECK <- deck
  
  SHUFFLE <- function(){
    indx <- sample(1:52,size = 52, replace = FALSE)
    assign("deck", DECK[indx, ], envir = parent.env(environment()))
  }
  
  DEAL <- function(){
    card <- deck[1,]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  list(shuffle = SHUFFLE, deal = DEAL)
}

game <- setup(deck)
deal <- game$deal
shuffle <- game$shuffle

rm(deck)

deal()
shuffle()

ls.str(environment(deal))
deal


# Project 3: Slot Machine

#• Use a practical strategy to design programs
#• Use if and else statements to tell R what to do when
#• Create lookup tables to find values
#• Use for , while , and repeat loops to automate repetitive operations
#• Use S3 methods, R’s version of Object-Oriented Programming
#• Measure the speed of R code
#• Write fast, vectorized R code

#play()
## 7 7 7
## $80
#The play function will need to do two things. First, it will need to randomly generate
#three symbols; and, second, it will need to calculate a prize based on those symbols.

get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
           prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
sum(c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52)) # Note that probabilites add to 1
#diamonds ( DD ), sevens ( 7 ), triple bars ( BBB ), double bars ( BB ), single bars ( B ), cherries ( C ),
#and zeroes ( 0 )


symbols <- get_symbols()

a <- 3.14
a <- a - trunc(a)
a


# Lookup Tables

payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25,
             "B" = 10, "C" = 10, "0" = 0)

payouts["DD"]

# If you want to leave behind the symbol’s name when subsetting, you can run the un
# name function on the output:
  unname(payouts["DD"])
# payouts is a type of lookup table
  
  
  
# To get the score

  score <- function(symbols) {
    # calculate a prize
    prize
  }

# if else statements 
  
  symbols[1] == symbols[2] & symbols[2] == symbols[3]
  ## TRUE
  symbols[1] == symbols[2] & symbols[1] == symbols[3]
  ## TRUE
  all(symbols == symbols[1])
  ## TRUE
  
    length(unique(symbols)) == 1
    
# The unique function returns every unique term that appears in a vector

    test <- c(1,1,1)
    unique(test)
    
    test <- c(1,2,3)
    unique(test)


    same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]


#    if (same) {
#      prize <- # look up the prize
#    } else if ( # Case 2: all bars ) {
#      prize <- # assign $5
#      } else {
#        # count cherries
#        prize <- # calculate a prize
#      }
# count diamonds
# double the prize if necessary

    
    bars <- symbols %in% c("B", "BB", "BBB")
   # else if (all(bars)) {

  

