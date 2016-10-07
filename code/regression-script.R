##################################################
# Regression Analysis
##################################################
# libraries
library(ggplot2)

# Import data
advertising <- read.csv('data/Advertising.csv')
advertising['X'] <- NULL


# ************************************************
# Regression
# ************************************************
simp_reg <- lm(Sales ~ TV, data = advertising)
sum_simp_reg <- summary(simp_reg)
save(simp_reg, sum_simp_reg, file = "data/regression.RData")

# ************************************************
# Regression Scatter Plot
# ************************************************
# scatter plot of tv and sales
scatter_tv_sales <- ggplot(advertising, aes(x = TV, y = Sales)) + geom_point(alpha = 0.6) + geom_smooth(method = 'lm') +
  ggtitle("Scatter Plot: TV vs Sales")
scatter_tv_sales

png('images/scatter-tv-sales.png')
scatter_tv_sales
dev.off()

pdf('images/scatter-tv-sales.pdf')
scatter_tv_sales
dev.off()
