x1 <- c(4.802, 3.81, 4.004, 4.467, 3.8)
x2 <- c(5.404, 5.256, 4.145, 5.401, 5.622, 4.312)
n1 <- length(x1)
n2 <- length(x2)
dtf <- data.frame(n = c(n1, n2), mean = c(mean(x1), mean(x2)), sd = c(sd(x1), sd(x2)))
dtf$se <- dtf$sd/sqrt(dtf$n)

x <- c(x1, x2)
x_bar <- mean(x)
n <- length(x)
se <- sd(x)/sqrt(n)

x <- c(1, 5, 5, 5, 7)
rank(x)

