plot(CO2$conc, CO2$uptake, 
     pch = 16, las = 1,
     xlab = expression(CO[2] * " concentration (mL/L)"),
     ylab = expression(CO[2] * ' uptake (' * mu * "mol/" * m^2 * "s)"))
    
library(ggplot2)
p1 <- ggplot(airquality) + geom_boxplot(aes(as.factor(Month), Ozone))
p2 <- ggplot(airquality) + geom_point(aes(Solar.R, Ozone))
p3 <- ggplot(airquality) + geom_histogram(aes(Ozone))
library(patchwork)
p1 + p2 + p3
p1 + p2 / p3
(p1 + p2) / p3