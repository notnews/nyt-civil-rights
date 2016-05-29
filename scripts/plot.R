
"
Plot the Quarterly NYT coverage of Civil Rights Issues

" 

# set dir.
setwd(githubdir)
setwd("nyt-civil-rights")

# Load the packages
library(lubridate)
library(ggplot2)
library(scales)
library(grid)

# Load data from using rtimes package
results <- read.csv("nyt_rtimes.csv")

# r_dates
results$startDate <- as.Date(as.character(results$startDate), format="%Y%m%d")

# Plotting mentions of 'Affirmative Action'
ggplot(results, aes(x=startDate, y=cr))+
geom_point(color="#42C4C7") +
geom_smooth(method = "gam", formula = y ~ s(x), aes(group=1), size = 1, colour="#777777", alpha=0.05, se=F) +
ylab("Number of Articles Containing Affirmative Phrases Related to Black Civil Rights")+
xlab("Year")+
theme_bw()+
scale_x_date(breaks=pretty_breaks(n=10)) + 
theme(panel.grid.major.y = element_line(colour = "#e3e3e3", linetype = "dotted"),
	  panel.grid.minor.x = element_blank(),
	  panel.grid.major.x = element_line(colour = "#f7f7f7", linetype = "solid"),
	  panel.border       = element_blank(),
	  legend.position  = "bottom",
	  legend.key       = element_blank(),
	  legend.key.width = unit(1,"cm"),
	  axis.title   = element_text(size=10),
	  axis.text    = element_text(size=8),
	  axis.ticks.y = element_blank(),
	  axis.title.x = element_text(vjust=-1),
	  axis.title.y = element_text(vjust= 1),
	  plot.margin = unit(c(0,.5,.5,.5), "cm"))
ggsave("figs/nyt_aa.png")
ggsave("figs/nyt_aa.pdf")
