library(here)
library(tidyverse)

df <- read.csv(here("data", "rawfludata.csv"))

df <- df %>% 
  rename(year = Year, week = Week, start = Start.date, end = End.date, cases = Total.number.of.influenza.positive.viruses)

df <- df %>% 
  select(year, week, start, end, cases)

write.csv(df, file = here("data", "fludata_short.csv"))
