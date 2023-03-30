library(tidyverse)

table1
table2
table3
table4a
table4b
table5

# Compute rate per 10,000
table1 %>% 
    mutate(rate = cases / population * 10000)

# Compute cases per year
table1 %>% 
    count(year, wt = cases)

tidy4a <- table4a %>% 
    pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
tidy4b <- table4b %>% 
    pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")

left_join(tidy4a, tidy4b)

wide2 <- table2 %>%
    pivot_wider(names_from = type, values_from = count)

iris |> 
    pivot_longer(-Species) |> 
    print()
