# Load in the mtcars data set built into R
data(mtcars)

# Let's look at the first few rows of it
head(mtcars)
# And now it's structure (str())
str(mtcars)

# Now let's test some super generic functions in R
# Try print()
print(mtcars)
# Seems to print out all objects in the data

# Now plot()
plot(mtcars)
# The ouput is extremly messy
# Let's just do one object from the data set
plot(mtcars$mpg)
# That looks a lot cooler and comprehensive 

# Now let's explore S3 vs. S4 objects
# Create S3 object
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

# Now S4 class and object
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

# Now let's inspect these objects to identify their differences
print(s3_obj)
print(s4_obj)
# They are output in different ways, interesting

# Now let's look at their structures to determine why they differ
str(s3_obj)
str(s4_obj)
# Now we can see R telling us why they are different and how



