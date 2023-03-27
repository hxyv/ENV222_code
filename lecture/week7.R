1 |>
    print()

library(tidyverse)
# base R
par(mfrow = c(2, 2))
for (i in 1:4) {
    boxplot(iris[, i] ~ iris$Species, las = 1, xlab = 'Species', ylab = names(iris)[i])
}

# tidyverse
iris |> 
    pivot_longer(-Species) |> 
    ggplot() +
    geom_boxplot(aes(Species, value)) +
    theme_classic() +
    facet_wrap(name ~.)

# base R
dtf1_mean <- data.frame(tapply(iris$Sepal.Length, iris$Species, mean, na.rm = TRUE))
dtf1_sd <- data.frame(tapply(iris$Sepal.Length, iris$Species, sd, na.rm = TRUE))
dtf1_median <- data.frame(tapply(iris$Sepal.Length, iris$Species, median, na.rm = TRUE))
# and other variables

# use a loop
dtf <- data.frame(rep(NA, 3))
for (i in 1:4) {
    dtf1_mean <- data.frame(tapply(iris[, i], iris$Species, mean, na.rm = TRUE))
    dtf1_sd <- data.frame(tapply(iris[, i], iris$Species, sd, na.rm = TRUE))
    dtf1_median <- data.frame(tapply(iris[, i], iris$Species, median, na.rm = TRUE))
    dtf1 <- cbind(dtf1_mean, dtf1_sd, dtf1_median)
    names(dtf1) <- paste0(names(iris)[i], '.', c('mean', 'sd', 'median'))
    dtf <- cbind(dtf, dtf1)
}

# tidyverse
dtf <- iris |> 
    pivot_longer(-Species) |> 
    group_by(Species, name) |> 
    summarise(mean = mean(value, na.rm = TRUE),
              sd   = sd(value, na.rm = TRUE),
              median = median(value, na.rm = TRUE))
dtf

