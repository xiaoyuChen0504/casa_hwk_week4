# Homework -- Week 4

# 1. Load Libraries
library(tidyverse)
library(sf)
library(here)
#library(janitor)
#library(countrycode)

# 2. Read Data
HDI <- read_csv(here::here("wk4_Data", 
                "HDR21-22_Composite_indices_complete_time_series.csv"),
                locale = locale(encoding = "latin1"), # specify encoding of the data
                na = " ", skip=0)
World <- st_read("wk4_Data/World_Countries_(Generalized)/World_Countries__Generalized_.shp")
