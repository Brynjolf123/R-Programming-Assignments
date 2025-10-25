# Let's simply read in the data set I chose from the Rdatasets collection
# That data set being cotton yield for each State in the U.S.
data <- read.csv("C:/Users/brynj/Downloads/R Programming Class/nass.cotton.csv")
head(data)

# Now we have to load in the packages for the plot and visualizations we will create
library(ggplot2)
# install.packages("lattice")
library(lattice)

# Must delet all the NA rows
data <- na.omit(data)

# 1. Base R graphs
# Scatter plot
plot(data$year, data$yield,
     main   = "Base: Year vs. Yield",
     xlab   = "Year",
     ylab   = "Yield")

# Histogram
hist(data$acres,
     main   = "Base: Distribution of acres",
     xlab   = "acres")

# 2. Lattice Graphs
# Conditional scatter plot (small multiples)
xyplot(yield ~ year | state,
       data = data,
       main = "Lattice: yield vs. year by state")

# Box-and-whisker plot
bwplot(acres ~ factor(year),
       data = data,
       main = "Lattice: acres by year")

# 3. ggplot2
# Scatter plot with smoothing
ggplot(data, aes(x = year, y = yield, color = acres)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "ggplot2: yield vs. year with trend by acres")


# Because there are so many years, I decided to create a new column of just centuries for this faceted histogram
# Create century categories
data$century <- cut(data$year, 
                    breaks = c(-Inf, 1899, 1999, 2099),
                    labels = c("19th century", "20th century", "21st century"))

# Faceted histogram
ggplot(data, aes(acres)) +
  geom_histogram(binwidth = 500000) +
  facet_wrap(~ century) +
  labs(title = "ggplot2: acre distribution by century") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))




