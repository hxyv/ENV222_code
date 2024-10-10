#1
x = 1
y = (exp(0.8-0.3*x)-exp(0.8-0.3*(x+1)))/exp(0.8-0.3*x)
y = round(y,2) * 100

# 2
# C

# 3
x = c(0.53, -0.84, 0.35, 0.2, -1.05, -1.56, -0.37, -0.7,
      0.19, -0.63, -1.12, -0.7, -1.28, 0.58, -0.91, -1.27,
      1.56, 1.12, -1.36, -0.05)
x_mean = mean(x)
x_sd = sd(x)
ks <- ks.test(x, 'pnorm', x_mean, x_sd)
round(ks$statistic, 3)

x0 <- c(0.53, -0.84, 0.35, 0.2, -1.05, -1.56, -0.37, -0.7,
        0.19, -0.63, -1.12, -0.7, -1.28, 0.58, -0.91, -1.27,
        1.56, 1.12, -1.36, -0.05)
x0_mean <- mean(x0)
x0_sd <- sd(x0)
eCDF <- ecdf(x0)

# cumulative distribution function F(x) of the reference distribution
CDF <- pnorm(x0, x0_mean, x0_sd)

# create a data frame to put values into
df <- data.frame(data = x0, eCDF = eCDF(x0), CDF = CDF)

# sort values of sample observations and remove duplicates
x <- unique(sort(x0))

# Calculate D
Daft <- abs(eCDF(x) - pnorm(x, x0_mean, x0_sd))
Dbef <- abs(c(0, eCDF(x)[-length(x)]) - pnorm(x, x0_mean, x0_sd))
D_score <- max(c(Daft, Dbef))



# 4
# Wilcoxon Signed-Rank test

# 5
val = c(1.58, 1.12, 0.93, 0.62, 0.37)
val = c(0.589, 0.376, 0.114, 0.097, 0.041)
val = c(0.589, 0.176, 0.114, 0.097, 0.011)
sum(val)
Proportion_of_Variance <- val / sum(val)
cumsum(Proportion_of_Variance)

Proportion_of_Variance = c(0.589, 0.176, 0.114, 0.097, 0.011)
cumsum(Proportion_of_Variance)
sum(Proportion_of_Variance)

# 6
#x <- data.frame(mean = c(0.632, 0.788), 
#                n = c(5, 8), 
#                se = c(0.059, 0.081))
#Cu <- diff(x$mean) |> round(3)
#cse <- sqrt(sum(x$se ^ 2 * (x$n - 1)) / (sum(x$n) - 2) * sum(x$n) / prod(x$n)) |> 
#    round(3)

dtf <- data.frame(n = c(5, 8), mean = c(0.632, 0.788), sd = c(0.059, 0.081))
dtf$se <- dtf$sd/sqrt(dtf$n)
cmean <-  sum(dtf$mean * dtf$n) / sum(dtf$n)
round(cmean, 3)
cse <- sqrt((sum(dtf$n * ((dtf$n - 1)* dtf$se ^ 2 + dtf$mean ^ 2)) - sum(dtf$n * dtf$mean) ^ 2/ sum(dtf$n)) / (sum(dtf$n) * (sum(dtf$n) - 1)))
round(cse, 3)

x <- data.frame(mean = c( 0.632,  0.788), n = c(5, 8), se = c(0.059,  0.081))
cmean <-  sum(x$mean * x$n) / sum(x$n)
cse <- sqrt((sum(x$n * ((x$n - 1)* x$se ^ 2 + x$mean ^ 2)) - sum(x$n * x$mean) ^ 2/ sum(x$n)) / (sum(x$n) * (sum(x$n) - 1)))
round(c(cmean, cse),3)

# 7
k = 5
k * (k - 1) / 2
# 10 times

# 8
dtf <- data.frame(LocationA = c(1036, 1120, 1288, 1148, 1120, 1064),
                  LocationB = c(812, 924, 952, 868, 840, 924),
                  LocationC = c(1372, 1316, 1288, 1344, 1344, 1316),
                  LocationD = c(1120, 1064, 1176, 1092, 1148, 1148),
                  LocationE = c(1400, 1288, 1372, 1344, 1372, 1288))

dtf2 <- stack(dtf)
names(dtf2) <- c("weight", "location")
n <- nrow(dtf2)
k <- nlevels(dtf2$location)
dfree <- n - k
t_critical <- qt(0.05/2, df = dfree, lower.tail = FALSE)
library(dplyr)
dtf_sm <- 
    dtf2 |> 
    group_by(location) |> 
    summarise(n = length(weight),
              sd = sd(weight),
              mean = mean(weight))
sp2 <- sum((dtf_sm$n - 1) * dtf_sm$sd ^ 2 )/ dfree
round(sp2, 1)
LSD <- t_critical * sqrt(sp2 * sum(1 / dtf_sm$n))
round(LSD, 3)

paired_groupmean <- combn(dtf_sm$mean, 2)
paired_groupmean[2, ] - paired_groupmean[1, ]

library(agricolae)
wg_aov <- aov(weight ~ location, data = dtf2)
lsd <- LSD.test(wg_aov, "location", p.adj = "bonferroni")


# 11
dtf2$group <- c(rep("b", 6), 
                rep("c", 6),
                rep("a", 6),
                rep("b", 6),
                rep("a", 6))
means <- aggregate(weight ~  location, dtf2, mean)
means$weight <- round(means$weight, 2)
library(ggplot2)
ggplot(dtf2, aes(x = reorder(location, weight, FUN = mean), 
                 y = weight)) +
    geom_boxplot(aes(fill=factor(group))) +
    stat_summary(fun=mean, colour="darkred", geom="point", 
                 shape=18, size=3, show.legend=FALSE) + 
    geom_text(data = means, aes(label = weight, y = weight + 0.08)) +
    xlab("Locations") +
    ylab("Weight (g)")


# 12
CO2
library(dplyr)
dtf <- CO2 |> 
    filter(Type == "Quebec") |> 
    filter(Treatment == "chilled")

m1 <- nls(uptake ~ SSasympOff(conc, a, b, c), data = dtf)
summary(m1)
a <- 38.8907
b <- -4.7398
concentration_0 <- -log(1/a)/b
asymptote <- a
concentration_0 <- round(concentration_0, 1)
asymptote <- round(asymptote, 1)


# 13
m2 <- nls(uptake ~ a * conc / (b + conc), data = dtf, start = list(a = 40, b = 170))
m1

m2 <- nls(uptake ~ SSmicmen(conc, a, b), data = dtf)
summary(m2)
summary(m1)
round(49.202, 1)
round(169.065, 1)

# 14
xv <- seq(0, 1000, 1)
y1 <- predict(m1, list(conc = xv))
y2 <- predict(m2, list(conc = xv))
dtf_predicted <- data.frame(xv, y1, y2)
ggplot(dtf) + 
    geom_point(aes(conc, uptake)) +
    geom_line(aes(xv, y1, color = 'Michaelis-Menten model'), data = dtf_predicted) + 
    geom_line(aes(xv, y2, color = '3-parameter asymptotic exponential model'), data = dtf_predicted) + 
    theme_bw() + 
    scale_color_manual(values = c('Michaelis-Menten model' = 'blue', '3-parameter asymptotic exponential model' = 'red')) +
    labs(color = 'Model') +
    guides(color = guide_legend(title = 'Models'))