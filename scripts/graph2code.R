dfper <- read.csv(here("data", "fludata_short.csv"))

dfper <- dfper %>% 
  select(-X)

# only use above for this script, use other data in markdown (still assign to dfper)

dfper <- dfper %>% 
  mutate(period = case_when(
    (year == 2015 & week >= 13)|(year == 2016 & week < 13) ~ "2015/2016",
    (year == 2016 & week >= 13)|(year == 2017 & week < 13) ~ "2016/2017",
    (year == 2017 & week >= 13)|(year == 2018 & week < 13) ~ "2017/2018",
    (year == 2018 & week >= 13)|(year == 2019 & week < 13) ~ "2018/2019",
    (year == 2019 & week >= 13)|(year == 2020 & week < 13) ~ "2019/2020",
    (year == 2020 & week >= 13)|(year == 2021 & week < 13) ~ "2020/2021",
    TRUE ~ "NA"
  ))

dfper <- dfper[!(dfper$period == "NA"), ]

dfper$week <- as.character(dfper$week)
dfper$week <- factor(dfper$week, levels = unique(dfper$week))

write.csv(dfper, file = here("data", "fludata_period.csv"))


p2 <- ggplot(data = dfper, aes(x = week, y = cases, group = period, colour = period))
p2 + geom_line() + geom_point()
