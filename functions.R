plot_histogram = function(data) {
  ggplot(data, aes(x = AGEYEARS)) + 
    geom_bar() +
    labs(x = "Age at death", y = "Frequency")
}

plot_deaths_by_year = function(data) {
  ggplot(data, aes(x = DEATH_YEAR)) + 
    geom_point(stat = "count")
}

get_maxima = function(data) {
  data %>%
    group_by(DEATH_YEAR) %>%
    summarise(MAX_AGE = max(AGEYEARS, na.rm = TRUE),
              DEATH_COUNT = n())
}    

plot_yearly_maxima = function(data) {
  ggplot(get_maxima(data), aes(x = DEATH_YEAR)) +
    geom_point(aes(y = MAX_AGE))
}

