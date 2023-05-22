curve(x/(1+x), 0, 10)


dtf <- read.table("data/mm.txt", header = T)

library(ggplot2)
ggplot(dtf) + 
    geom_point(aes(conc, rate))

model <- nls(rate ~ SSmicmen(conc, a, b), data = dtf)
summary(model)

model4 <- nls(rate ~ SSasymp(conc, a, b, c), data = dtf)
summary(model4)


model2 <- nls(rate ~ a * conc / (b + conc), data = dtf, start = list(a = 200, b = 0.05))
summary(model2)

model3 <- nls(rate ~ a  - b * exp(-c * conc),
              data = dtf,
              start = list(a = 200, b = 150, c = 4.835804))
summary(model3)

xv <- seq(0, 1.2, 0.01)
yv <- predict(model, list(conc = xv))
dtf_predicted <- data.frame(xv, yv)
ggplot(dtf) +
    geom_point(aes(conc, rate)) +
    geom_line(aes(xv, yv), data = dtf_predicted)

sse <- as.vector((summary(model)[[3]])^2*10)
null <- lm(dtf$rate~1)
sst <- as.vector(unlist(summary.aov(null)[[1]][2]))
R2 <- (sst-sse)/sst

a <- 2
b <- 4
curve(x ^ a + b, -100, 100)
curve(exp(x), -10, 1) 

dtf <- jaws
