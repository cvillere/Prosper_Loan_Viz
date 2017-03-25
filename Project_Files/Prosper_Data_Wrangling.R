################################################################################
getwd()
library(plyr)
detach(package:plyr)
library(dplyr)

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

write.table(Grouped.Totals, file='Grouped_Totals.csv', quote=FALSE, sep=',', 
            row.names = F)
  
str(Grouped.Totals)  
  



