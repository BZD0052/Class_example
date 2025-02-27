#creating a vector named as z
z <- c(1:200)
#mean
mean(z)
#Stanard deviation
sd(z)
# Logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise.
zlog <- z>30
zlog

#making a dataframe with z and  zlog as cloumn.

zdf <- data.frame(z, zlog)
zdf

#changing the col names 
colnames(zdf) <- c("zvec", "zlogic")
zdf

#adding new column named zsquared with squaring zvec
zdf$zsquared <- zdf$zvec^2
zdf

#subsetting dataframe
help(subset)
#with the subset () function to only include values of zsquared greater than 10 and less than 100 
subset_zdf <- subset(zdf, zsquared >10 & zsquared<100)
subset_zdf
#with and without the subset () function to only include values of zsquared greater than 10 and less than 100 
withoutsubset_zdf <- zdf[zdf$zsquared >10 & zdf$zsquared <100,]
withoutsubset_zdf
#subbsetibng to include row 26
subset_zdf_row26 <- zdf[26,]
subset_zdf_row26

#subsetting to only the value in zsquared from row 180
zsquared_180 <- zdf$zsquared[180]
zsquared_180


## Reading csv file named Tips.csv

Tips <- read.csv(file.choose()) ## without considering the missing values

TipsR <- read.csv("/Users/bzd00/Downloads/Reproducibility/TipsR.csv", na.strings = ".")

# I used 2 methods to load the .csv file in R. Tips is the file where I have not accounted for the missing value. So, we can see “.” In the dataset when we open it in R in gender column.
# However, when I accounted for the missing value using na.strings in my second df named TipsR. We can see these missing values accounted by R and is now represented as N/A by R.