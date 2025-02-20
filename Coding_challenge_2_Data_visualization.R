#This is the coding challenge two which is for data visualization lecture.
#Read .csv
DON.database <- read.csv("/Users/bzd00/Downloads/Reproducibility/MycotoxinData.csv", na.strings = "na") #na.string to account for the missing values named as "na".
str(DON.database) #visualize the structure of the data frame.

library(ggplot2) # loading the ggplot2 package

####### Question 2 #######

#BOX-PLOT
ggplot(DON.database, aes(x = Treatment, y = DON, color = Cultivar )) +
  geom_boxplot() +   # creates box plot.
  xlab("") +   #Keeping X label blank.
  ylab ("DON (ppm)")  # Naming Y label as DON (ppm)


###### Question 3 #######
#Bar chart with standard error
ggplot(DON.database, aes(x = Treatment, y = DON, color = Cultivar )) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +  # Adds bars for mean values
  stat_summary( fun.data = mean_se, geom = "errorbar", position = "dodge") + # Adds error bars. ## use the dodge to get rid of overlapping error bars
  xlab("") +
  ylab ("DON (ppm)") 


###### Question 4 ######
## Adding points to the foreground of the box plot and bar chart you made in question 3 that show the distribution of points over the boxplots. 
#Setting the shape = 21 and the outline color black (hint: use jitter_dodge). 
ggplot(DON.database, aes(x = Treatment, y = DON, fill = Cultivar )) +
  geom_boxplot() +  # Adds box plot
  stat_summary( fun.data = mean_se, geom = "errorbar") +  # Adds standard error bars.
  geom_point(position = position_jitterdodge(dodge.width = 0.8), color = "black", shape = 21) +  # Jitters and dodges points to avoid overlap.
  xlab("") +
  ylab ("DON (ppm)") 


####### Question 5 #####
# Using the colorblind pallet. 
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
#Plot
ggplot(DON.database, aes(x = Treatment, y = DON, fill = Cultivar )) +
  geom_boxplot() +
  scale_fill_manual(values = c(cbbPalette)) +  #Applies the colorblind-friendly palette to the fill aesthetic.
  theme_classic()+    # Uses a classic theme with a clean, minimal design.
  geom_point(position = position_jitterdodge(dodge.width = 0.8), shape = 21) + # Jitters and dodges points to avoid overlap. Shape 21- filled circles with outlines.
  xlab("") +
  ylab ("DON (ppm)") 


#######Question 6 ######
## use facet to split the plots 
ggplot(DON.database, aes(x = Treatment, y = DON, fill = Cultivar )) +
  geom_boxplot() +
  scale_fill_manual(values = c(cbbPalette)) +
  theme_classic()+
  geom_point(position = position_jitterdodge(dodge.width = 0.8), shape = 21) +
  xlab("") +
  ylab ("DON (ppm)") +
  facet_wrap(~Cultivar) ### Splits the plot into panels based on the Cultivar variable.


####### Question 7 ######\
#Transparency to points 
ggplot(DON.database, aes(x = Treatment, y = DON, fill = Cultivar )) +
  geom_boxplot() +
  stat_summary( fun.data = mean_se, geom = "errorbar") + # Adds standard error bars.
  scale_fill_manual(values = c(cbbPalette)) + # Applies the cbbpalette to the fill aesthetic.
  theme_classic()+
  geom_point(position = position_jitterdodge(dodge.width = 0.8), shape = 21, alpha = 0.3) +  # Alpha adds transparency to the points (0 = fully transparent, 1 = fully opaque).
  xlab("") +
  ylab ("DON (ppm)") +
  facet_wrap(~ Cultivar)


######## Question 8 ########
#another way to represent the above data.
# Tried line, violin and beeswarm plot

####Line plot using stat_summary()
ggplot(DON.database, aes(x = Treatment, y = DON, color = Cultivar, group = Cultivar)) +
  stat_summary(fun = "mean", geom = "line") +  # Lines connecting mean values
  stat_summary(fun = "mean", geom = "point") +  # Points for mean values
  stat_summary(fun.data = "mean_se", geom = "errorbar", width = 0.2) +  # Error bars
  scale_color_manual(values = cbbPalette) +  
  theme_classic() +  
  xlab("") +  
  ylab("DON (ppm)") + 
  facet_wrap(~ Cultivar)  

## Trying it with geom_line.

?stat_summary ## to see documentation #
ggplot(DON.database, aes(x = Treatment, y = DON, color = Cultivar, group = Cultivar)) +
  geom_line(stat = "summary", fun = "mean") +  #creates line connecting the mean values. Similar to stat_summary(fun = "mean", geom = "point").
  geom_point(stat = "summary", fun = "mean", na.rm = TRUE) + #adds points for mean values.
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  scale_color_manual(values = cbbPalette) +
  theme_classic() +
  xlab("") +
  ylab("DON (ppm)") +
  facet_wrap(~ Cultivar)

###Violin plot

ggplot(DON.database, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_violin(scale = "width", alpha = 0.5, trim = FALSE) +  # Violin plot
  geom_boxplot(width = 0.2, fill = "white", alpha = 0.7) +  # Boxplot inside violin
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.1, color = "black", size = 0.5) +  # SE bars
  geom_point(position = position_jitterdodge(dodge.width = 0.8), color= "black", shape = 21, alpha = 0.3) + #jitter points
  scale_fill_manual(values = cbbPalette) +  # Use cbbPalette for  colors
  theme_bw() +
  xlab("") +
  ylab("DON (ppm)") +  # Update y-axis label (no log scale)
  facet_wrap(~ Cultivar) +
  theme(text = element_text(face="bold"),        #Bold all text
        axis.text.x = element_text(color= "black", angle = 45, hjust = 1))     # Rotate x-axis labels for better readability

#### Trying the beeswarm package.
# Install and load the ggbeeswarm package
install.packages("ggbeeswarm")

# Create the beeswarm plot
library(ggbeeswarm)

# Create the beeswarm plot
ggplot(DON.database, aes(x = Treatment, y = DON, color = Treatment)) +
  geom_beeswarm(cex = 3, alpha = 0.7, size = 2, shape = 16) +  # Adjust point size and shape
  stat_summary(fun.data = mean_se, geom = "pointrange", color = "black", size = 0.5) +  # Add mean and error bars
  scale_color_manual(values = cbbPalette) +  # Use cbbPalette for treatment colors
  theme_classic() +
  xlab("") +
  ylab("DON (ppm)") +
  facet_wrap(~ Cultivar) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))    # Rotate x-axis labels for better readability

 


