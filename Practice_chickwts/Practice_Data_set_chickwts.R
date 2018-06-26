require(GGally)     # Required for ggpairs
require(ggplot2)    # GGally supersets on ggplot2
require(gridExtra)
library('datasets')

data(chickwts)


str(chickwts)
summary(chickwts)

ggpairs(data=chickwts, # data.frame with variables
        title="Weight and Feed", 
        aes(color=feed)) 

# T-testing

meat <- chickwts[chickwts$feed=="meatmeal",1]
horse <- chickwts[chickwts$feed=="horsebean",1]


t.test(meat, horse)       # parametric, assumes normality
wilcox.test(meat, horse)  # Non-parametric
                          # If comparing same subjects different
                          # affects/treatments (pop1,pop2, paired=T)
boxplot(meat, horse)      # for both t.test and wilcox.test

subset_plot_meat<-ggplot(data=meat, aes(x = "meatmeal", y = weight)) +
  geom_boxplot()

plot1<-subset_plot_meat + ylim(100,400)

subset_plot_horse<-ggplot(data=horse, aes(x = "horsebean", y = weight)) +
  geom_boxplot()

plot2<-subset_plot_horse + ylim(100,400)

grid.arrange(plot1, plot2, ncol =2)