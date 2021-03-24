library(tidyverse)

df$year <- as.character(df$year)

p1 <- ggplot(df, aes(x = week, y = cases, group = year, colour = year))
p1 + geom_line() + geom_point()
