# Homework -- Week 4

# 1. Load Libraries
library(tidyverse)
library(sf)
library(here)
library(janitor)
library(countrycode)

# 2. Read Data
HDI <- read_csv(here::here("wk4_Data", 
                "HDR21-22_Composite_indices_complete_time_series.csv"),
                locale = locale(encoding = "latin1"), # specify encoding of the data
                na = " ", skip=0)
World <- st_read("wk4_Data/World_Countries_(Generalized)/World_Countries__Generalized_.shp")

# 3. Data Manipulation
# Select necessary columns & Convert country names into country codes

HDIcols<- HDI %>%
  clean_names()%>%
  select(iso3, country, gii_2019, gii_2010)%>%
  mutate(difference=gii_2019-gii_2010)%>%
  mutate(iso_code=countrycode(country, origin = 'country.name', destination = 'iso2c'))%>%
  mutate(iso_code2=countrycode(iso3, origin ='iso3c', destination = 'iso2c'))
# country.name: country name (English)
# iso3c: ISO-3 character
# iso2c: ISO-2 character

## 4. Join the csv to world shape file

Join_HDI <- World %>% 
  clean_names() %>%
  left_join(., 
            HDIcols,
            by = c("iso" = "iso_code"))






