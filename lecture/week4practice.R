dtf <- read.csv("data/student_names.csv")


library(dplyr)
y <- dtf$Name %>% 
    nchar() %>%
    which.max() %>%
    dtf$Name[.]

x <- "The quick brown fox jumps over the lazy dog"
xlower <- tolower(x)
dtf$pro <- toupper(dtf$Prgrm)

xsingle <- strsplit(xlower, " ") %>% 
    print()
xsingle1 <- strsplit(xlower, "") %>%
    print()
xsingle1 <- xsingle1[[1]]
xsingle[[1]][2]

table(xsingle1) %>%
    plot()

length(table(xsingle1))
duplicated(xsingle1)
unique(xsingle1)

family_name <- dtf$Name %>% 
    strsplit(" ") %>%
    sapply(tail, 2) %>%
    print()

library(tidyr)
separate(dtf, col = Name,
         into = c("GivenName", "LastName"),
         sep = " ")
x
substr(x, 13, 15)
paste(x, ".", sep = " ")
paste0(x, ".")

paste(dtf$Name, collapse = "-")






