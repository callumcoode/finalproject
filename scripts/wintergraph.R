dfwin <- read.csv(here("data", "fludata_short.csv"))

dfwin <- dfwin %>% 
  select(-X)

# only use above for this script, use other data in markdown (still assign to dfper)

dfwin <- dfwin %>% 
  mutate(period = case_when(
    (year == 2015 & week >= 38)|(year == 2016 & week <= 20) ~ "2015/2016",
    (year == 2016 & week >= 38)|(year == 2017 & week <= 20) ~ "2016/2017",
    (year == 2017 & week >= 38)|(year == 2018 & week <= 20) ~ "2017/2018",
    (year == 2018 & week >= 38)|(year == 2019 & week <= 20) ~ "2018/2019",
    (year == 2019 & week >= 38)|(year == 2020 & week <= 20) ~ "2019/2020",
    (year == 2020 & week >= 38)|(year == 2021 & week <= 20) ~ "2020/2021",
    TRUE ~ "NA"
  ))

dfwin <- dfwin[!(dfwin$period == "NA"), ]

dfwin$week <- as.character(dfwin$week)
dfwin$week <- factor(dfwin$week, levels = unique(dfwin$week))

write.csv(dfwin, file = here("data", "fludata_winter.csv"))

p3 <- ggplot(data = dfwin, aes(x = week, y = cases, group = period, colour = period))
p3 + geom_line() + geom_point()
