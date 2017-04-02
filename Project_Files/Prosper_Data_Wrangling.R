################################################################################
getwd()
library(plyr)
detach(package:plyr)
library(dplyr)
library(ggplot2)
#install.packages(ggplot)

setwd("/Users/christianvillere/DandProjects/Data_Viz/Final_Project/Project_Files")
Prosper_Data <- read.csv("prosperLoanData.csv")

#wrangle year from origination data
Prosper_Data$CreationYear <- substring(Prosper_Data$ListingCreationDate, 0, 4)

#Move the new column to beginning of dataframe
Prosper_Data <- Prosper_Data[,c(1:2,82,3:81)]


#check for duplicates
Duplicate_Entries <- Prosper_Data[duplicated(Prosper_Data$ListingKey),]


#Remove duplicates
Prosper_Data_Unique <- Prosper_Data[!duplicated(Prosper_Data$ListingKey),]


#working dataset
Working_Data <- subset(Prosper_Data_Unique, select = c(CreationYear,
                       ListingCategory..numeric., LoanOriginalAmount, 
                       StatedMonthlyIncome))


#Final Dataset used to create graphic
Grouped.Totals <- Working_Data %>%
  group_by(CreationYear, ListingCategory..numeric.) %>%
  summarise(total_loan = sum(LoanOriginalAmount),
            Avg_Inc = median(StatedMonthlyIncome),
            Avg_Loan = median(LoanOriginalAmount),
            Count_Category_Num = n())


?by

by(Grouped.Totals, Grouped.Totals["ListingCategory..numeric."], summary)

#Move the new column to beginning of dataframe
Prosper_Data <- Prosper_Data[,c(1:2,82,3:81)]


subset_data <- subset(Grouped.Totals, 
    Grouped.Totals$ListingCategory..numeric. %in% c(1, 2, 6, 15:20))


p1 <- ggplot(aes(x = CreationYear, y = total_loan), data = subset_data) +
  geom_point() + geom_line(group = 1)


#1)real big ramp up for category 1(debt consolidation) from 09-13, before a dip.
#2)same story for cat. 2(Home improvement) as cat. 1
#3)spiked from 07 to 08. Diped to 09. Rose steadily to a spike in 12. Diped a 
#little in 13. Diped big time from 13 to 14. cat.3(business)
#4) cate. 4(personal), big increase from 07 to 08, but no other data exists
#except for those years.
#5)huge increase from 07 to 08. huge decline from 08 to 09. no movement 
#from 09 to 10. cate.5(student)
#6)rises from 07 to 08. falls from 08 to 09. rises for 09 to 12. Falls from 
#12 to 14. cate. 6(auto)
#7) is other category. so not exploring
#8) huge increase from 11 to 13, before a decrease from 13 to 14. 
# cate. 8(baby and adoption)
#9) flat line from 12 to 13, before it craters from 13 to 14. cate. 9 (Boat).
#10) only info for 12 and 13. drops 60% from 12 to 13. cate. 10(cosmetic)
#11) huge increase from 11 to 12. subsequent drops from 12 to 14. only info
#for 11 to 14. cate. 11(engagement ring)
#12) huge increase from 11 to 12. small increase from 12 to 13. steep drop
#from 13 to 14. cate. 12(green loans)
#13) huge increase from 11 to 12. small decreases from 12 to 13 and 13 to 14.
#cate. 13(household expenses)
#14) huge increase from 11 to 12 and 12 to 13. pretty big drop from 13 to 14
#cate. 14(large purchases)
#15) huge increase from 11 to 12. Slight decrease from 12 to 13. Big 
#dropoff from 13 to 14. cate. 15(medical/dental)
#16) huge increase from 11 to 12. decrease from 12 to 13 and 13 to 14. 
#cate. 16(motorcycle)
#17) starts high in 12. Decreases from 12 to 13 and 13 to 14. cate. 17(RV)
#18) shoots up from 11 to 12. stays flat from 12 to 13. decreases 
#significantly from 13 to 14. cate. 18(Taxes)
#19) shoots up significantly from 11 to 12, before subsiding from 12 to 13 and 
#13 to 14. cate. 19(vacation)
#20) shoots up siginificantly from 11 to 12, before subsiding from 12 to 13 and
#13 to 14. cate. 20(wedding)

#data used for dimple.js graph
subset_data <- subset(Grouped.Totals, 
                      Grouped.Totals$ListingCategory..numeric. %in% c(1, 2, 6, 15:20))

subset_data <- subset(subset_data, select = -debt_cate)

subset_data$debt_cate = ifelse(subset_data$ListingCategory..numeric. == 1, 
                        "Debt Consolidation", 
                        ifelse(subset_data$ListingCategory..numeric. == 2, 
                        "Home Improvement", 
                        ifelse(subset_data$ListingCategory..numeric. == 6, 
                        "Auto", 
                        ifelse(subset_data$ListingCategory..numeric. == 15, 
                        "Medical_Dental", 
                        ifelse(subset_data$ListingCategory..numeric. == 16, 
                        "Motorcycle", 
                        ifelse(subset_data$ListingCategory..numeric. == 17, 
                        "RV", 
                        ifelse(subset_data$ListingCategory..numeric. == 18, 
                        "Taxes", 
                        ifelse(subset_data$ListingCategory..numeric. == 19, 
                        "Vacation", 
                        ifelse(subset_data$ListingCategory..numeric. == 20, 
                        "Wedding", "Other")))))))))


write.table(subset_data, file='Consum_vs_Spec.csv', quote=FALSE, sep=',', 
            row.names = F)

write.table(Grouped.Totals, file='Grouped_Totals.csv', quote=FALSE, sep=',', 
            row.names = F)
  
str(Grouped.Totals)  
  



