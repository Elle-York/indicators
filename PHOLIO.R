# SQL output to PHOLIO conversion ---------------------------------------------

# This script pulls in your indicator output and then converts each indicator to PHOLIO output
# Just change the values to match the indicator
# Be careful as every data sheet is formatted differently!

# 1. Packages/Libraries -------------------------------------------------------

library(tidyverse)
library(data.table)
library(PHEindicatormethods)
library(readxl)
library(xlsx)
library(lubridate)

# 2. Read in your indicator output (saved as CSV file)

df <- fread("my_data.csv") # change for each indicator

names(df) # Check column headings of output match section 3, differs every time!


# 3. Convert to PHOLIO --------------------------------------------------------


df <- df %>%
  transmute(IndicatorID = 91884, # Your Indicator no. here
            Year = period, # The year in the SQL output
            YearRange = 1, # 1 = Annual
            Quarter = -1,
            Month = -1, 
            AgeID = 27, # Check age group
            SexID = 4, # 4 = ALL
            AreaCode = areacode,
            Count = count,
            Value = dsr, # Change
            LowerCI95 = lowerci,
            UpperCI95 = upperci,
            LowerCI99_8 = -1,
            UpperCI99_8 = -1,
            Denominator = denominator,
            Denominator_2 = -1,
            ValueNoteId = 0,
            CategoryTypeId = -1,
            CategoryId = -1)

# 4. Save to PHOLIO csv ----------------------------------------------------------


write.xlsx(df,file = "91884_LA.xlsx", sheetName = "PHOLIO") # this is just an example of how you might name it!
