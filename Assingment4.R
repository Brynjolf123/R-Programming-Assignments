# Let's load in the matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

# Check if the matrices are square
dim(A)  # should be 10 × 10
dim(B)  # 10 × 100 — not square

# Knowing that one of the matrices is not square we will handle the errors with inv() and det() 
# For A
invA <- solve(A)
detA <- det(A)

# For B, use tryCatch to capture errors
invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)

# Explanation for the errors: The first error noted is that solve(A) cannot be executed since it's exactly singular. 
# What the error message is telling us is that the matrix is linear yet dependent. That means the rows and columns determine the value, 
#and it's an addition of 10 to each row and it previous values (i.e. first row = 10, second = 10 + 10, third = 20 + 10 etc.). 
#In other words it's a combination of other rows to make further ones. This makes inversion impossible. Though inversion isn't possible, 
#the determinant gives us 0. This is quite predictable since 0 means it can't be inversed which was noted from the error.
#Further the 0 means the matrix does not scale in the slightest. 

#The errors from the B matrix simply come from the fact that the matrix is not a square. 
#It not being a square results in it being unfit for linear algebra calculation. It all had me a bit confused at first, 
#but the more I read into it it the more it made sense.