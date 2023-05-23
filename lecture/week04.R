x <- "hello world"
nchar(x)
strsplit(x, "")
substr(x, 1, 2)
substring(x, 1, 2)
sub(x, "e", "o")

dtf <- read.csv("data/student_names.csv")
length(dtf)
table(dtf)

nchar(dtf$Name)
which.max(nchar(dtf$Name))
dtf$Name[which.max(nchar(dtf$Name))]
xlower <- tolower(x) |> print()
dtf$pro <- toupper(dtf$Prgrm) |> print()

name_split <- strsplit(dtf$Name, " ")
lapply(name_split, length)
lapply(name_split, nchar)
sapply(name_split, length)
sapply(name_split, nchar)

dtf$Name[which.max(sapply(name_split, length))]

library(tidyr)
dtf2 <- separate(dtf, Name, c("Given Name", "Last Name"), sep=" ")

dtf$NameAbb <- substr(dtf$Name, 1, 2) |> print()

paste(x, ".", sep="")
paste(dtf$NameAbb, collapse = " ")
paste(dtf$NameAbb, dtf$Name, sep = ". ")

grep("e", x)
regexpr("h", x)


gsub(" ", "-", x) %>% 
    gsub("-", " ", .)
grep("^[[:alpha:]]{6} [[:alpha:]]{2}", dtf$Name, value=TRUE)


d1 <- "2/11/1962"
d1
d1 + 1
d2 <- Sys.Date() |> print()
d2 + 1
d2 + 100
t2 <- Sys.time()
t2
t2 + 1
t2 + d2

class(t2)
class(d2)

d3 <- as.Date("2/11/1962", format="%d/%m/%Y")
as.numeric(d3)
d3 + 2617
format(d3, "%Y %y")

library("Epi")
data("diet")
diet
str(diet)

bdat <- diet$dox[1] |> print()

max(diet$dox)
range(diet$dox)
mean(diet$dox)
median(diet$dox)
diff(range(diet$dox))
difftime(max(diet$dox), min(diet$dox), units="days")

Epi::cal.yr(bdat)
diet2 <- Epi::cal.yr(diet)
str(diet2)

bd <- "1994-09-22 20:30:00"
class(bd)
bdtime <- strptime(x=bd, 
                   format="%Y-%m-%d %H:%M:%S",
                   tz="Asia/Shanghai")

class(bdtime)
bdtime$wday
str(bdtime)
bdtime$year
bdtiem$Y
bdtime$Y
bdtime$Year
bdtime$year
bdtime$YEAr
unclass(bdtime)
print(bdtime)
format(bdtime, format="%d/%m/%Y")
date()
Sys.Date()
