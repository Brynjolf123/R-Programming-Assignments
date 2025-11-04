# Create a matrix to test the buggy function
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

# I had to install a package for the tukey_outlier() function
# install.packages("lares")
library(lares)

# The function
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey_outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}


# Test the function
tukey_multiple(test_mat)

# An error is produced:
# Error in if (type == "package") package <- topic : 
# missing value where TRUE/FALSE needed

# Now we fix the function to a '&' instead of '&&'
corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey_outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

corrected_tukey(test_mat)

# Result: 
# > corrected_tukey(test_mat)
# [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE

# Check what the tukey_outlier function does
tukey_outlier(test_mat[ ,1])
# It only produces thresholds based off the input

# Now let's alter the code one last time to derive our desired results
corrected_tukeyV2 <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  
  for (j in seq_len(ncol(x))) {
    # Get thresholds
    thresholds <- tukey_outlier(x[, j])
    
    # Check which elements in column j are outliers
    col_outliers <- x[, j] < thresholds["bottom_threshold"] | 
      x[, j] > thresholds["top_threshold"]
    
    # AND with existing outlier status
    outliers[, j] <- outliers[, j] & col_outliers
  }
  
  # Check if each row is an outlier in ALL columns
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  outlier.vec
}


corrected_tukeyV2(test_mat)

# Result:
# > corrected_tukeyV2(test_mat)
# [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE


