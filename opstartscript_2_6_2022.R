library(tidyverse)
library(readxl)

# mogelijk moet je het pad nog aanpassen
bestandsnaam <- "2022-05-03 data_kreeften_vegetatie_HHSK_CoP_Ecodata 2-6-2022.xlsx"

excel_sheets(bestandsnaam)

data_kreeften <- read_excel(bestandsnaam, "data_kreeften")
data_kreeften_detail <- read_excel(bestandsnaam, "data_kreeften_detail")
data_vegetatie_soorten <- read_excel(bestandsnaam, "data_vegetatie_soorten")
data_vegetatie_kenmerken <- read_excel(bestandsnaam, "data_vegetatie_kenmerken")
data_meetpunten <- read_excel(bestandsnaam, "data_meetpunten")
namen_kreeften <- read_excel(bestandsnaam, "namen_kreeften")

# let op - in sommige gevallen is er sprake van missende data

veg_km_wide <- 
  data_vegetatie_kenmerken %>% 
  select(-kenmerknaam) %>% 
  pivot_wider(names_from = kenmerkcode, values_from = kenmerk_waarde) %>% 
  type_convert(locale = locale(decimal_mark = ","))



  
  