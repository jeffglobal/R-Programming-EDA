require(GGally)     # Required for ggpairs
require(ggplot2)    # GGally supersets on ggplot2
library('datasets')
data(chickwts)
str(chickwts)
summary(chickwts)


ggpairs(data=chickwts, # data.frame with variables
        title="Weight and Feed", 
        aes(color=feed)) 