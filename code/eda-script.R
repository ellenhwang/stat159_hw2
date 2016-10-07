##################################################
# Exploratory Data Analysis
##################################################
# libraries
library(ggplot2)

# Import data
advertising <- read.csv('data/Advertising.csv')
advertising['X'] <- NULL

# Exploration and Summary Statistics
str(advertising)

sink('eda-output.txt')
summary(advertising)
sink(NULL)

# ************************************************
# Visualizations
# ************************************************
# histogram of sales
hist_sales <- ggplot(advertising, aes(x = Sales)) + geom_histogram(aes(y = ..density.., fill = ..density..), binwidth = 1) +
                  geom_density() + ggtitle("Histogram of Sales")

#histogram of tv
hist_tv <- ggplot(advertising, aes(x = TV)) + geom_histogram(aes(y = ..density.., fill = ..density..), binwidth = 10) +
                  geom_density() + scale_fill_gradient("Density", low = '#006400', high = 'palegreen') + ggtitle("Histogram of TV") 

# Export Visualizations
png('images/histogram-tv.png')
hist_tv
dev.off()

pdf('images/histogram-tv.pdf')
hist_tv
dev.off()

png('images/histogram-sales.png')
hist_sales
dev.off()

pdf('images/histogram-sales.pdf')
hist_sales
dev.off()

png('images/scatter-tv-sales.png')
scatter_tv_sales
dev.off()

pdf('images/scatter-tv-sales.pdf')
scatter_tv_sales
dev.off()
