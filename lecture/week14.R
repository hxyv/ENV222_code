x <- iris[1:7, 1:2]
xpc <- princomp(x, cor=TRUE, score=TRUE)
par(mfrow=c(1, 2))
plot(x$Sepal.Width, x$Sepal.Length, pch=as.character(1:7))
biplot(xpc)

data <- iris
com1 <- prcomp(data[, 1:4], center=TRUE, scale.=TRUE)
summary(com1)

dt <- as.matrix(scale(data[, 1:4])) # normalization
com2 <- princomp(dt, cor=TRUE)
summary(com2) |> print()

com3 <- princomp(dt)
summary(com3)

# Visualization
library(ggplot2)
pc_score <- com1$x # get the pc score
pc_score <- data.frame(pc_score, iris$Species)
summ <- summary(com1)
xlab <- paste0("PC1(", round(summary(com1)$importance[2, 1] * 100, 2), "%)")
ylab <- paste0("PC2(", round(summary(com1)$importance[2, 2] * 100, 2), "%)")
p2 <- ggplot(data = pc_score, aes(x=PC1, y=PC2, color=iris.Species)) +
    stat_ellipse(
        aes(fill=iris.Species),
        type="norm",
        geom="polygon",
        alpha=0.2,
        color=NA
    ) +
    geom_point() +
    labs(x=xlab, y=ylab, color="") +
    guides(fill="none")
p2 + scale_fill_manual(values=c("pink", "orange", "purple")) +
    scale_colour_manual(values=c("pink", "orange", "purple"))
print(p2)



dtf <- data.frame(conc = c(13.31, 13.67, 12.805, 13.1, 13.39, 12.375, 11.58, 14.58, 12.029, 13.69, 14.14, 12.54, 15.63, 13.66, 15.51, 13.23, 13.25, 15.2, 14.18, 14.53), 
                  city = c(rep("A", 10), rep("B", 10)))

dtf[duplicated(dtf$conc),]

m <- sum(dtf$city == "A")
n <- sum(dtf$city == "B")
x <- dtf$conc[dtf$city == "A"]
y <- dtf$conc[dtf$city == "B"]
U1 <- sum(outer(x, y, ">")) + sum(outer(x, y, "==")) * 0.5
U2 <- sum(outer(y, x, ">")) + sum(outer(y, x, "==")) * 0.5

Upper = 77
Lower = 23
curve(dwilcox(x, m, n), 0, to = 100, ylab = 'Probability distribution density', las = 1, type = 's')
abline(h = 0)
segments(x0 = c(23, 24, 76), y0 = 0, x1 = c(23, 24, 76), y1 = dwilcox(c(23, 24, 76), m, n), col = c('blue', 'red', 'red'))
legend('topright', legend = c('Distribution curve', 'Critical values', 'U score'), col = c('black', 'red', 'blue'), lty = 1)
