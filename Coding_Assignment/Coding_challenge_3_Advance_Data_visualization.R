---
title: "C0ding_challenge_3_advance_visualization"
author: "Bibek"
date: "2025-02-20"
output: html_document
---

```{r}
##Coding Challenge 3- Advance Visualization####
#Read .csv
#DON.database <- read.csv("/Users/bzd00/Downloads/Reproducibility/MycotoxinData.csv", na.strings = "na") #na.string to account for the missing values named as "na".
#using relative path
DON.database <- read.csv("Sample_data/MycotoxinData.csv", na.strings = "na")
str(DON.database) #visualize the structure of the data frame.

library(ggplot2) # loading the ggplot2 package
library(ggpubr) ##integrating multiple statistics and plots

cbbPalette <-c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
myCols <- cbbPalette[c(3, 4)]  ## choosing 3rd and 4th color palette from the cbbPalette.

##Question 1####
#Create a boxplot for DON (deoxynivalenol) values
DON <- ggplot(DON.database, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(0.85), outlier.shape = NA ) +   # Create boxplots with dodge positioning; remove default outlier points.
  geom_point(position = position_jitterdodge(0.3), shape = 21, color ="black", alpha =0.6) +  #jittered points to show individual observations
  scale_fill_manual(values = myCols) + ## Use custom fill colors for the Cultivar groups.
  ylab("DON(ppm)") + # Label the y-axis and remove x-axis label.
  xlab("") +
  theme_classic() +
  facet_wrap(~Cultivar) # Create separate panels for each Cultivar.

DON #Visualize plot

###Question 2###
#Reorder the factor order level
DON.database$Treatment <- factor(DON.database$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))

DON # Re-displaying the plot will now use the new Treatment order.

###Question 3###
#Change the y-variable to plot X15ADON and MassperSeed_mg. 

# Boxplot for X15ADON values
X15ADON <- ggplot(DON.database, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(0.85), outlier.shape = NA) +
  geom_point(shape = 21, color = "black", position = position_jitterdodge(0.3), alpha = 0.6) +
  scale_fill_manual(values = myCols) +
  ylab("15ADON") + # y-axis label for X15ADON
  xlab("") +
  theme_classic() +
  facet_wrap(~Cultivar)
  
X15ADON # Display the X15ADON plot

# Boxplot for MassperSeed_mg (Seed Mass in mg)

MassperSeed_mg <- ggplot(DON.database, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(0.85), outlier.shape = NA) +
  geom_point(shape = 21, color = "black", position = position_jitterdodge(0.3), alpha = 0.6) +
  scale_fill_manual(values = myCols) +
  ylab("Seed Mass (mg)") +  # y-axis label for Seed Mass
  xlab("") +
  theme_classic() +
  facet_wrap(~Cultivar)

MassperSeed_mg #Display the MassperSeed_mg plot


###Question 4####
# Combining all plots together

Fig_combo<-ggarrange(    ## Arrange the three plots (DON, X15ADON, MassperSeed_mg) side by side in one row
  DON,
  X15ADON,
  MassperSeed_mg,
  labels = "auto", # Add labels (a, b, c) to each plot
  nrow = 1,  # Arrange in one row
  ncol = 3,   # Three columns
  legend = FALSE,   # Do not display the legend in the combined plot
  common.legend = T    #If TRUE, a common unique legend will be created for arranged plots.
)

Fig_combo # Visualize the combined figure

#####Question 5#####
#Use geom_pwc() to add t.test pairwise comparisons to the three plots made above. 

#Using combined p-value and asterisk (*) to indicate significance
Stat.DON <- DON + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}",  # Group comparisons by Treatment, t-test for comparisons, p-values (adjusted) as labels
           size = 0.8,       # thickness of the bracket line
           label.size = 3)    # text size for the p-value labels

Stat.DON #Display plot

Stat.X15ADON <- X15ADON +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}",
           size = 0.8,       # thickness of the bracket line
           label.size = 3)    # text size for the p-value labels

Stat.X15ADON #Display plot


Stat.MassperSeed_mg <- MassperSeed_mg +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}",
           size = 0.8,       # thickness of the bracket line
           label.size = 3)    # text size for the p-value labels

Stat.MassperSeed_mg #Display plot

#Combining all stats plots together
## Arrange the three plots (DON, X15ADON, MassperSeed_mg) side by side in one row
Stat_Fig_combo<-ggarrange( 
  Stat.DON,
  Stat.X15ADON,
  Stat.MassperSeed_mg,
  labels = "auto", # Add labels (a, b, c) to each plot
  nrow = 1, # Arrange in one row
  ncol = 3, # Three columns
  legend = FALSE, # Do not display the legend in the combined plot
  common.legend = T    #If TRUE, a common unique legend will be created for arranged plots.
)

Stat_Fig_combo #Display plot


```

