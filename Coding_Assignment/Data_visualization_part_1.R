#Basic Data Visualization with R Studio
data("mtcars") #built-in dataset
str(mtcars) #structure of dataframe

#Scatter plot - Simple
plot(mtcars$wt, mtcars$mpg)
plot(mtcars$wt, mtcars$mpg,
     xlab ="Car Weight",
     ylab = "Miles per Gallon",
     font.lab = 7, 
     pch = 22)  # pch - plotting character


#### ggplot2 ####
#install.package("ggplot2)
library(ggplot2)  #load the package
ggplot()  ##no plot- no data

#ggplot(mtcars,aes(x= wt, y= mpg)) ## empty plot. you need to add layer.

ggplot(mtcars,aes(x= wt, y= mpg)) +
  geom_smooth(method = lm,se = FALSE, color= "Green") +  #geom_smooth to add a layer for a trend line with liner model (lm).
  # geom_point(aes(size =wt, color = wt)) + ## weight 
  ##for comparing other variable like cylinder and horsepower
  geom_point(aes(size =cyl, color = hp)) +
  xlab("Log10 Weight") +
  ylab("Miles per Gallon") +
  scale_color_gradient( low ="purple", high = "black") +
  scale_x_log10() +   #log10 change to X axix
  scale_y_continuous(labels = scales::percent) # Change the proportion data into percentage.

##INFO for above codes##
##geome_point adds points 
##geome_smooth with lm basically make the best fitting line between two variables.
##se controls for the confidence layer


#Categorical and Numerical examples

bull.richness <- read.csv("/Users/bzd00/Downloads/Reproducibility/Bull_richness.csv")
str(bull.richness)

# Sub-setting the data to soybeans
bull.richness.soy.no.till <- bull.richness[bull.richness$Crop == "Soy" &
                                             bull.richness$Treatment == "No-till",]
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) +
  geom_boxplot() +
  xlab("") +
  ylab ("Fungal richness") +
  geom_point(position = position_jitterdodge(dodge.width= 0.8)) #Helps to jitter the points.



#Visualization in bar graph
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) +
  geom_point(position = position_jitterdodge(dodge.width = 0.8)) +
  stat_summary(fun=mean,geom="bar") +
  stat_summary(fun.data = mean_se, geom ="errorbar") +
  xlab("") +
  ylab("Fungal richness") 
  

# stat_summary for plotting the mean and standard error.
# Plot looks ugly. needs to tell manually to dodge the bar. So for this add a position dodge at stat summary

ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) +
  stat_summary(fun=mean,geom="bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom ="errorbar", position = "dodge") +
  xlab("") +
  ylab("Fungal richness") +
  geom_point(position = position_jitterdodge(dodge.width = 0.8))

## only outline is colored. why? Some ggplot layers works on colors while some in fill.So, need to add a fill while working with both.


ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide, fill = Fungicide)) +
  stat_summary(fun=mean,geom="bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom ="errorbar", position = "dodge") +
  xlab("") +
  ylab("Fungal richness") +
  geom_point(position = position_jitterdodge(dodge.width = 0.8))

########## LINES ##########
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "errorbar") +
  xlab("") +
  ylab("Fungal richness")

############# Faceting ##############
# This allows to make separate multiple plots for each subset of the data via facet_wrap().

ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width =0.8) +
  xlab("") +
  ylab("Fungal richness") +
  #facet_wrap(~Treatment) ; if you need only treatment 
facet_wrap(~Treatment*Crop) #Need to add Crop also So just add the crop at facet wrap as *crop.

# Still not great. Needs to be scaled for better visualization so use the scale function.

## using the scale
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width =0.8) +
  xlab("") +
  ylab("Fungal richness") +
  facet_wrap(~Treatment*Crop, scales = "free") 

## Facet order change at last line.
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width =0.8) +
  xlab("") +
  ylab("Fungal richness") +
  facet_wrap(~Crop*Treatment, scales = "free") 

