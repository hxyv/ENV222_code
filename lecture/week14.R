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
