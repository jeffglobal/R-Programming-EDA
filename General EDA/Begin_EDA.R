# Beginning Data Analysis

require(ggplot2)
require(mgcv)
require(dplyr)

# Data set

str(Orange)
summary(Orange)



plot(Orange)

# Normality Testing

qqnorm(Orange$circumference)
qqline(Orange$circumference)
shapiro.test(Orange$circumference)

qqnorm(Orange$age)
qqline(Orange$age)
shapiro.test(Orange$age)

# histogram(Orange)
# densityplot(Orange)
# boxplot(Orange)



my_gplot<- ggplot(Orange, aes(x=age, y=circumference))

my_output<-my_gplot + geom_point(aes(color=Tree)) +

# geom_smooth(method="lm", color="black", show.legend = T) +
# loess < 1,000 item dataset < gam
# geom_smooth(method="loess", color='green', show.legend = T) +
# geom_smooth(method="glm", color='blue', show.legend =  T) 
# glm generalized linear smooths
  
  geom_smooth(method='lm', aes(color='linear')) +
  geom_smooth(method='lm', formula = y ~ poly(x,2), aes(color='polynomial')) +
  geom_smooth(method="lm", formula = y ~ x + I(x^2), aes(color='quadratic')) +
  geom_smooth(method='lm', formula = y ~ x * log(x), aes(color='logarithmic'))

# Exponential not yet working  
# geom_smooth(method='lm', formula = y ~ exp(x), aes(color='exponential'))

# ggplots facets
my_output + facet_wrap( ~ Tree, nrow = 2)

# my_output + facet_grid(. ~ circumference)

# facet_wrap(~age, nrow = 2)
# plot facets
#  Facet_wrap(~Tree)
# rlm, robust linear model, didn't see it work
# Use geom_smooth instead of stat_geom for all standard plots.

# Ordering Data

ordered_Trees<-c(1,2,3,4,5)
Orange2<- arrange(transform(Orange, Tree=factor(Tree,levels=ordered_Trees)),Tree)

my_gplot<- ggplot(Orange2, aes(x=age, y=circumference))

my_output<-my_gplot + geom_point(aes(color=Tree)) +
  geom_smooth(method='lm', aes(color='linear')) +
  geom_smooth(method='lm', formula = y ~ poly(x,2), aes(color='polynomial')) +
  geom_smooth(method="lm", formula = y ~ x + I(x^2), aes(color='quadratic')) +
  geom_smooth(method='lm', formula = y ~ x * log(x), aes(color='logarithmic'))

# ggplots facets
my_output + facet_wrap( ~ Tree, nrow = 2)