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

