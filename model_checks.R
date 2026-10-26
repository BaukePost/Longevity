library(longevity)
library(ggplot2)

excess <- samp_elife(n = 1000, scale = 1, shape = 0, family = "gp")
data = data.frame(age_at_death = 105 + excess)

ggplot(data = data, mapping = aes(x = age_at_death)) +
  geom_histogram()

fitted <- fit_elife(
  time = data$age_at_death,
  thresh = 105,
  family = "gp",
  export = TRUE)

## QQ Plot
plot(fitted, which.plot = "pp", plot.type = "ggplot")

## PP plot
plot(fitted, which.plot = "pp", plot.type = "ggplot")

## Threshold stability plot
u = 105:112

tstab(data$age_at_death, thresh = u, family = "gp")

