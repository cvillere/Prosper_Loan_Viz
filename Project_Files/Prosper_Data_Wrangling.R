################################################################################
getwd()
setwd("/Users/christianvillere/DandProjects/Data_Viz/Final_Project/Data_Files")
Prosper_Data <- read.csv("prosperLoanData.csv")

#wrangle year from origination data
Prosper_Data$CreationYear <- substring(Prosper_Data$ListingCreationDate, 0, 4)

#Move the new column to beginning of dataframe
Prosper_Data <- Prosper_Data[,c(1:2,82,3:81)]

#check for duplicates
Duplicate_Entries <- Prosper_Data[duplicated(Prosper_Data$ListingKey),]

#Remove duplicates
Prosper_Data_Unique <- Prosper_Data[!duplicated(Prosper_Data$ListingKey),]

Working_Data <- subset(Prosper_Data_Unique, select = CreationYear,
                       ListingCategory..numeric., LoanOriginalAmount, 
                       StatedMonthlyIncome)


#create variable that has year of origination
format(as.Date(Prosper_Data$Date, format="%d/%m/%Y"),"%Y")