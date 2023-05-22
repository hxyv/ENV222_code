install.packages("ACSWR")
library(ACSWR)
library(reshape2)
data(usc, package = "ACSWR")
pairs(usc)
ucor <- cor(usc)
melt_cor <- melt(ucor)
library(ggplot2)
ggplot(data = melt_cor, aes(x = Var1, y = Var2, fill = value)) +
    geom_tile() +
    geom_text(aes(Var2, Var1, label = value),
              color = "black", size = 2)
dev.off()

install.packages("heatmaply")
library(heatmaply)
heatmaply_cor(x = cor(usc), xlab = "Features",
              ylab = "Features", k_col = 0.5, k_row = 0.5)

crime_rate_lm <- lm(R ~ Age + S + Ed + Ex0 + Ex1 + LF + M + N + NW + U1 + U2 +
                        W + X, data = usc)
# or
crime_rate_lm <- lm(R ~ ., data = usc)
summary(crime_rate_lm)
