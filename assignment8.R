# I chose a data file from Rdatasets that contains GPAs, Gender, Study Weeks, and more data from Duke University Students
dataDuke <- read.csv("C:/Users/brynj/Downloads/R Programming Class/gpa_tbl_df.csv")

# And let's set the working directory
setwd("C:/Users/brynj/Downloads/R Programming Class")

# Now that I have succesfully read in the csv. file I will load in my R packages necessary for the assignment
library(plyr)

# Before I go any further with the code I need to check the str() of the new data set
str(dataDuke)
# I can immediately identify some things that need changing in the data set
# First let's change the studyweek from an integer into a numeric
dataDuke$studyweek <- as.numeric(dataDuke$studyweek)
# Second, let's just get rid of the first column "rownames"
dataDuke <- dataDuke[ ,2:6]
# Now let's see how it all looks
str(dataDuke)
# looks good

# Since we have also chosen a data set that has gender and GPAs we can do a similar computation as seen in the assignment example
gender_mean <- ddply(
  dataDuke,
  "gender",
  summarise,
  GradeAverage = mean(gpa, na.rm = TRUE)
)

# The same goes for how store it as a text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

# Now we will do a twist on what the assignment example gives next by manipulating the text file output by study week
# This is far easier with numeric type data in comparison to string data but the intention is still the same as the assignment asks

week_data <- subset(
  dataDuke,
  studyweek > 30
)

# But I notice how the assignment asks for string manipulation, so I will do that with the only string column in the data set, 'gender'
sex_data <- subset(
  dataDuke,
  grepl("f", gender, ignore.case = TRUE)
)
# This produces an output that only has string values that contain the letter "f" which would clearly be only females then. Not as fun or unique
# as study week observations.


# Now we only show what genders were present in study weeks over 30 and store that as a csv. file
write.csv(
  week_data$gender,
  file      = "week_data.csv",
  row.names = FALSE,
  quote     = FALSE
)

# Now we write out all the columns that met the criteria of a study weeks being over 30 and store into a different csv. file
write.csv(
  week_data,
  file      = "week_data_full.csv",
  row.names = FALSE
)

