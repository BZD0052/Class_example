############################### Data Visualization Part Two ######################################
## Basic ggplot syntax, data types, usage of scales, position arguments, faceting and themes ##
#For Publication worthy figures.
############### Topics covered ##############
#Figure design for accessibility
#plotting multiple plots together
#Integration of basic statistics for exploratory analysis
#Integration of text and labels
#Keeping it simple: what makes a good plot and why

# Loading Package #
library(tidyverse)
library(ggpubr) ##integrating multiple statistics and plots
library(ggrepel) ## labeling the points

#color palette
cbbPalette <-c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#actual file path
#bac.sample.data <- read.csv("/Users/bzd00/Downloads/Reproducibility/BacterialAlpha.csv", na.strings = "na") 

#using relative file path
bac.sample.data <- read.csv("Sample_data/BacterialAlpha.csv", na.strings = "na") 
# changing the Time_point & crop into factor.
bac.sample.data$Time_Point <- as.factor(bac.sample.data$Time_Point)
bac.sample.data$Crop <-as.factor(bac.sample.data$Crop)
bac.sample.data$Crop <- factor(bac.sample.data$Crop, levels = c("Soil", "Cotton", "Soybean"))

  
str(bac.sample.data)
  
### Plot one B
bac.even <-ggplot(bac.sample.data, aes(x =Time_Point, y=even, color = Crop)) +
  geom_boxplot(position = position_dodge(0.85)) + # Create box plots for each Crop at each Time_Point
  geom_point(position = position_jitterdodge(0.05)) # Add jittered points to show individual data points
  xlab("Hourse post sowing") +
  ylab("Pielou's evenness") +
  scale_color_manual(values = cbbPalette) + # Use a custom color palette for Crop
  theme_classic()   # Use a classic theme for the plot
bac.even  
  
###Plot 2 A
no.soil.sample.data <- subset(bac.sample.data, Crop !="Soil") # Exclude Soil samples

water.imbibed <- ggplot(no.soil.sample.data,aes(Time_Point, 1000*Water_Imbibed, color = Crop)) +
  geom_jitter(width = 0.5, alpha = 0.5) + # Add jittered points to show individual data points
  stat_summary(fun = mean, geom = "line", aes(group = Crop)) +  # Add a line for the mean of each Crop
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) + # Add error bars for the mean
  ylab("Hours post sowing") +
  xlab("Water Imbibes (mg)") +
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("", ""))  + # Use specific colors from the palette
  theme_classic() +
  theme(strip.background = element_blank(), legend.position = "none") + #Remove legend and strip background
  facet_wrap(~Crop, scales = "free") # Create separate panels for each Crop, with free scales
  
water.imbibed


######Plot 3 C######
water.imbibed.cor <- ggplot(no.soil.sample.data, aes(1000* Water_Imbibed, even, color = Crop)) + 
  geom_point(aes(shape = Time_Point)) + # Add points with shapes representing Time_Point
  geom_smooth(se = FALSE, method = lm) + # Add a linear regression line without confidence intervals
  xlab("Water Imbibed (mg)") +  # Label the x-axis
  ylab("Pielou's evenness") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("Cotton", "Soybean")) +  # Manually set colors for the Crop variable
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("0 hrs", "6 hrs", "12 hrs", "18 hrs")) +  # Manually set shapes for the Time.Point variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales

water.imbibed.cor


# Arrange multiple ggplot objects into a single plot
Figure2 <-ggarrange(
  water.imbibed,
  bac.even,
  water.imbibed.cor,
  labels = "auto", # Add labels (a, b, c) to each plot
  nrow = 3,
  ncol = 1,
  legend = FALSE
  )

Figure2


### Integrating statistics with the plot
# with anova p-values.
bac.even +
  stat_compare_means(method = "anova")  
# with p-values as significance levels
bac.even +
  geom_pwc(aes(group = Crop), method = "t.test", label = "p.adj.format")
#with asterisk (*) as significance levels
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.signif")
#with combined p-value and asterisk (*) to indicate significance
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "{p.adj.format}{p.adj.signif}")




####Displaying the Correlation####

water.imbibed.cor +
  stat_cor()  ##with r value and p value.
  
# for equation
water.imbibed.cor +  
  stat_regline_equation()  

# Reading differential abundance data
diff.abund<- read.csv("Sample_data/diff_abund.csv")
str(diff.abund)
diff.abund$log10_pvalue <- -log10(diff.abund$p_CropSoybean) # Calculate -log10 of p-values

diff.abund.label <- diff.abund[diff.abund$log10_pvalue >25,] #  Filtering the data to include only highly significant points >25

# Create volcano plot
ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) +  # Plot all points with color mapping for significance
  theme_classic() + 
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) # Add labels for significant points

# More publishable plot
volcano <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) + 
  scale_color_manual(values = cbbPalette, name = "Significant") 
  theme_classic() + 
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano

#another version
volcano <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue)) + 
  geom_point(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue), color = "red", shape = 17, size = 4) +  # Highlighting significant points in red (triangle shape, larger size)
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, label = Label), color = "red") +  # Add red text labels to the significant points
  theme_classic() + 
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano
