require(GGally)     # Required for ggpairs
require(ggplot2)    # GGally supersets on ggplot2
library('datasets')
data(chickwts)
str(chickwts)
summary(chickwts)


ggpairs(data=chickwts, # data.frame with variables
        title="Weight and Feed", 
        aes(color=feed)) 

# T-testing
data(chickwts, package = 'reshape')
attach(chickwts)
meat <- chickwts[chickwts$feed=="meatmeal",1]
horse <- chickwts[chickwts$feed=="horsebean",1]

meat_index<-seq(length(meat))
meat_df<-as.data.frame(meat_index,meat)

horse_index<-seq(length(horse))
horse_df<-as.data.frame(horse_index,horse)

boxplot(meat, horse)

# meat_pt<-ggplot(data = meat_df, aes(x = meat_index, y=meat)) + 
#   geom_boxplot(notch=F)
# 
# horse_pt<-ggplot(data = horse_df, aes(x = horse_index, y=horse)) + 
#   geom_boxplot()

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  if (is.null(layout)) {
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    for (i in 1:numPlots) {
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
} 



# multiplot(meat_pt, horse_pt, cols=2)