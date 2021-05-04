# Setup
# -----
#
# The CDSW library includes
# a number of helper functions you can use from within R sessions.

library('cdsw')

# [ggplot2](http://ggplot2.org/) is a great way to make pretty graphs.

library('ggplot2')


# Load Data
# ---------
#
# Download and load Cars93 car data.

system('wget -nc https://raw.github.com/vincentarelbundock/Rdatasets/master/csv/MASS/Cars93.csv')
cars <- read.csv('Cars93.csv')
head(cars)
summary(cars$Type)

# Explore
# -------

qplot(cars$MPG.city, main="Cars MPG City")
qplot(cars$MPG.city, cars$Horsepower,
  main="City MPG vs. Horsepower",
  xlab="City MPG", ylab="Horsepower")
qplot(cars$Wheelbase, cars$Weight,
    main="Wheelbase Vs. Car Weight",
    xlab="Wheelbase", ylab="Car Weight") +
  geom_smooth(method = "loess")


# Model
# -----
#
# Regress City MPG on number of cylinders and weight

fit <- lm(MPG.city ~ Cylinders + Weight, data=cars)
summary(fit)

