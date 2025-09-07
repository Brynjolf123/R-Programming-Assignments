# Today we are going to be testing our own myMean function
# First let's create a vector to store data

assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

# Now lets create the myMean function and see if it can help us find the average
myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}

# Call myMean
myMean(assignment2)