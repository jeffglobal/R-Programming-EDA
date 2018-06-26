# Beginning Data Analysis

library(ggplot2)

# Data set

str(Orange)
summary(Orange)

plot(Orange)

my_gplot<- ggplot(Orange, aes(x=age, y=circumference))

my_gplot + geom_point(aes(color=Tree)) +
  # geom_smooth(method="lm", color="black", show.legend = T) +
# loess < 1,000 item dataset < gam
# geom_smooth(method="loess", color='green', show.legend = T) +
# geom_smooth(method="glm", color='blue', show.legend =  T) 
# glm generalized linear smooths
  geom_smooth(method='lm', aes(color='linear')) +
  geom_smooth(method='lm', formula = y ~ poly(x,2), aes(color='polynomial')) +
  geom_smooth(method="lm", formula = y ~ x + I(x^2), aes(color='quadratic')) +
  geom_smooth(method='lm', formula = y ~ x * log(x), aes(color='logarithmic')) +
# Exponential not yet working  
  geom_smooth(method='lm', formula = y ~ exp(x), aes(color='exponential')) +
# ggplots facets
  facet_wrap(~Tree) +
# plot facets
  Facet_wrap(~Tree)
# rlm, robust linear model, didn't see it work
# Use geom_smooth instead of stat_geom for all standard plots.
