library(tidyverse)

df$year <- as.character(df$year)

p1 <- ggplot(df, aes(x = week, y = cases, group = year, colour = year))
p1 + geom_line() + geom_point()


dftest %>% 
  filter(year == "2020")
head(dftest)

vec <- c(1:20)
vec <- as.character(vec)
grepl(4, vec)
