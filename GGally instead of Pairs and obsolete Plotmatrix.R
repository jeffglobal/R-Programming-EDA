require(GGally)
data(tips, package="reshape")

ggpairs(data=iris, # data.frame with variables
        columns=1:4, # columns to plot, default to all.
        title="Flower Data", # title of the plot
        mapping = ggplot2::aes(color=Species)) # aesthetics, ggplot2 style?


ggpairs(data=tips, # data.frame with variables
        columns=1:3, # columns to plot, default to all.
        title="tips data", # title of the plot
        mapping = ggplot2::aes(color=sex)) # aesthetics, ggplot2 style?

#--------------------------------------------------
p_ <- function(pm) {
  if (interactive()) {
    print(pm)
  }
  invisible()
}

data(tips, package = "reshape")
pm <- ggpairs(tips[, 1:3])
p_(pm)
pm <- ggpairs(tips, 1:3, columnLabels = c("Total Bill", "Tip", "Sex"))
p_(pm)
pm <- ggpairs(tips, upper = "blank")
p_(pm)

#--------------------------------------------------
# Generic Matrix plot
plotList <- list()
for (i in 1:6) {
  plotList[[i]] <- ggally_text(paste("Plot #", i, sep = ""))
}
a <- ggmatrix(
  plotList,
  2, 3,
  c("A", "B", "C"),
  c("D", "E"),
  byrow = TRUE
)
#a

a <- ggmatrix(
  plotList,
  2, 3,
  xAxisLabels = c("A", "B", "C"),
  yAxisLabels = NULL,
  byrow = FALSE,
  showXAxisPlotLabels = FALSE
)
#a