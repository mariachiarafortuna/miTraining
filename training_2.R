library(readxl)

# Import
mdata <- read_excel("media-data.xlsx")

# Select
library(dplyr)

tv_radio <- mdata %>%
  select(Week, Start, Eventi, Temperatura, Qty,
         Tv_15 = TV_15, Tv_30, Radio_15, Radio_30) 

tv_radio_17 <- tv_radio %>%
  filter(Start >= "2017-01-01" & Start <= "2017-12-31")


# Mutate

tv_radio_report <- tv_radio %>%
  mutate(Tv_15 = round(Tv_15, 2),
         Tv_30 = round(Tv_30, 2),
         Tv = Tv_15 + Tv_30,
         If_Tv = case_when(
           Tv > 0 ~ 1,
           TRUE ~ 0),
         If_Tv_2 = case_when(
           Tv == 0 ~ 0,
           Tv < 100 ~ 1,
           Tv >= 100 & Tv < 200 ~ 2,
           TRUE ~ 3)
         )


library(lubridate)

tv_radio_report <- tv_radio_report %>%
  mutate(Anno = year(Start),
         Mese = month(Start, label = T, abbr = F))


write.csv(tv_radio_report, file = "tv_radio_report.csv")
  

