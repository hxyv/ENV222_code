set.seed(20221228)
train.sub <- sample(nrow(iris), round(0.8 * nrow(iris)))
train.data <- iris[train.sub, ]
test.data <- iris[-train.sub, ] 

install.packages("faraway")
library(faraway)
data(gala)
fit.gala <-
    glm(
        Species ~ Endemics + Area + Elevation + Nearest + Scruz + Adjacent,
        data = gala,
        family = poisson()
    )
summary(fit.gala)
step(step(fit.gala))
