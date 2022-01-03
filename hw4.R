install.packages("haven")
library(haven)

Ozone <- read_sav("C:/Users/Magha/OneDrive/Desktop/ozone.sav")
table(Ozone$temp)


install.packages("sqldf")
library(sqldf)

HSD <- read.csv("C:/Users/Magha/OneDrive/Desktop/hsd2020.csv")
I <-sqldf("select UNITID,INSTNM, STABBR from HSD")


EF<-read.csv("C:/Users/Magha/OneDrive/Desktop/ef2020a.csv")

G <- sqldf("select UNITID, EFALEVEL, EFTOTLT from EF where EFALEVEL=1")

J <- sqldf("select i.UNITID, i.INSTNM, i.STABBR, g.EFTOTLT
           from I i left join G g on i.Unitid=g.UNITID")

sqldf("Select SUM(EFTOTLT) from G")





