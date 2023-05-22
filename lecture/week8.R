m <- 1:100
siglevel <- 0.05
(1 - (1 - (siglevel / m)) ^ m)

dtf <- read.csv("data/teaching_methods.csv")
summary(aov(Test ~ Method, data = dtf))
summary(aov(Satisfaction ~ Method, data = dtf))

set.seed(123)
x1 <- rnorm(100, mean = 5, sd = 2)
x2 <- rnorm(100, mean = 8, sd = 2)

boxplot(x1, x2, names = c("Group 1", "Group 2"), col = c("red", "blue"))
t.test(x1, x2)
