# Load in the matrices
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

#Now let's simply look at how the matrices look
A
B
# Simply try and add/subtract the matrices from one another
ApB <- A + B
A_B <- A - B
# Print out the results
ApB
A_B

# Now let's create a matrix with the diag() function
D <- diag(c(4, 1, 2, 3))
# Let's take a peak
D

# Now we need to create a custom 5x5 matrix
# First let's make a simple diagonal matrix with just 3
E <- diag(c(3, 3, 3, 3, 3))
# Now let's take a look
E
# I am going to create two seperate vectors that will be added to the E matrix
F <- c(3, 2, 2, 2, 2)
G <- c(3, 1, 1, 1, 1)

# Now lets see if we can just add these two new vectors to the E matrix and get the desired result
E[ ,1] <- F
E[1, ] <- G

# Now let's see how the matrix E looks like
E
