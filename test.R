dtf <- data.frame(diet1 = c(90, 95, 100),
                  diet2 = c(120, 125, 130),
                  diet3 = c(125, 130, 135))
dtf2 <- stack(dtf)
names(dtf2) <- c("wg", "diet")
wg_aov <- aov(wg ~ diet, data = dtf2)
summary(wg_aov)

n <- nrow(dtf2)
k <- nlevels(dtf2$diet)
dfree <- n - k
t_critical <- qt(0.05/2, df = dfree, lower.tail = FALSE)

sp2 <- sum((3 - 1) * apply(dtf, 2, sd) ^ 2)/ dfree
LSD <- t_critical * sqrt(sp2 * (1/3 + 1/3 + 1/3))

dtf_groupmean <- colMeans(dtf)
paired_groupmean <- combn(dtf_groupmean, 2)
paired_groupmean[2, ] - paired_groupmean[1, ]

# better using the long table consistently:
library(dplyr)
dtf_sm <- 
    dtf2 |> 
    group_by(diet) |> 
    summarise(n = length(wg),
              sd = sd(wg),
              mean = mean(wg))
sp2 <- sum((dtf_sm$n - 1) * dtf_sm$sd ^ 2 )/ dfree
LSD <- t_critical * sqrt(sp2 * sum(1 / dtf_sm$n))
dtf_groupmean <- colMeans(dtf)
paired_groupmean <- combn(dtf_sm$mean, 2)
paired_groupmean[2, ] - paired_groupmean[1, ]

library(agricolae)
LSD.test(wg_aov, "diet", p.adj = "bonferroni") |> print()

m <- choose(nlevels(dtf2$diet), 2)
alpha_cor <- 0.95
alpha_cor <- 0.05 / m

t.test(wg ~ diet, dtf2, subset = diet %in% c("diet1", "diet2"), conf.level = 1 - alpha_cor)
t.test(wg ~ diet, dtf2, subset = diet %in% c("diet1", "diet3"), conf.level = 1 - alpha_cor)
t.test(wg ~ diet, dtf2, subset = diet %in% c("diet2", "diet3"), conf.level = 1 - alpha_cor)

diet_pt <- pairwise.t.test(dtf2$wg, dtf2$diet, pool.sd = FALSE,var.equal = TRUE, p.adj = "none") |> print()
diet_pt <- pairwise.t.test(dtf2$wg, dtf2$diet, pool.sd = FALSE,var.equal = TRUE, p.adj = "bonf") |> print()

diet_pt$p.value < 0.05

# Create a sample of heights
heights <- c(70, 72, 67, 68, 69, 71, 68, 73, 70, 68)

# Perform a t-test
result <- t.test(heights, mu = 68)

# View the result
result
