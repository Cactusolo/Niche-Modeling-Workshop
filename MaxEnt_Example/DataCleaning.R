#Niche Modeling Workshop - July 25th, 2015 - Botany Meeting, Edmonton
#Data Cleaning Script
#Charlotte Germain-Aubrey - email: cgermain@ufl.edu

#install the packages we need (only do it once)
install.packages("data.table")
install.packages("dplyr")
install.packages("sp")
install.packages("maptools")
install.packages("spatstat")
install.packages("rgeos")
install.packages("rgdal")

#load all the libraries we will need here (each time you oepn the script)
library(data.table)
library(dplyr)
library(sp)
library(maptools)
library(spatstat)
library(rgeos)
library(rgdal)

#set the working directory
setwd("~/Desktop/NicheModelingWorkshop/MaxEnt_Example/")

#load the dataset first
raw.data <- read.csv(file="datasets/SampleFL-data.csv", header=TRUE)
head(raw.data)
raw.data$species
unique(raw.data$species)
length(unique(raw.data$species))

##############Taxonomic Name Resolution#############
#first make a list of all taxa in our dataset
mynames <- unique(raw.data$species)
write.csv(mynames, "mynames.csv")

##########We will now use the online iPlant Collaborative Tool. There are R options also if you want to try at home. 
#Now call the iPlant tool for resolving the taxon names (includes a fuzzy matching component)
#install.packages("taxize")
#library(taxize)
#query <- tnrs(query = mynames, source = "iPlant_TNRS")
#query <- gnr_resolve(mynames)

iplants <- read.table("tnrs_results.txt", sep= '\t', header=TRUE)
head(iplants)
corr.names <- cbind(as.character(iplants$Name_matched), as.character(iplants$Accepted_name))
head(corr.names)
corr.names <- corr.names[-1,]
colnames(corr.names) <- c("species", "new")
head(corr.names)
head(raw.data)
new.names <- gsub(" ", "\\_", corr.names)
head(new.names)

work.data <- raw.data
head(work.data)
work.data$species <- as.character(work.data$species)
m <- merge(work.data, new.names, by = "species")
head(m)
m$species <- m$new
m$new <- NULL
head(m)
unique(m$species)
length(unique(m$species))

#################################Rounding up############
# we here need to think about how fine or coarse our maps will be. Let' look at the date range for our collections
unique(m$year)
m$year <- gsub("\\N", NA, m$year)
unique(m$year)
m$year <- as.numeric(m$year)
unique(m$year)
min.age <- min(na.omit(m$year))
min.age
max.age <- max(na.omit(m$year))
max.age
# for the oldest specimen, how precise do you think the geolocation actually is ? 
# look at this table (at the equator)
# decimal
# places   degrees          distance
# -------  -------          --------
# 0        1                111  km
# 1        0.1              11.1 km
# 2        0.01             1.11 km
# 3        0.001            111  m
# 4        0.0001           11.1 m
m$lat <- round(m$lat, digits = 2)
m$lat
m$long <- round(m$long, digits = 2)

###############cleaning special cases of long or lat of 0
dim(m)
m1 <- subset(m, m$lat != 0.00)
m1 <- subset(m1, m1$long != 0.00)
dim(m1)

#################Removing duplicate rows
m.unique <- m1 %>% distinct
dim(m.unique)

#################Clipping to Florida
#Look at the points and see how some are out of place
plot(m.unique$long, m.unique$lat, pch=".")
#Upload a shapefile of Florida to use to get rid of points outside of it
myshapefile <- readShapePoly("FL/FLstate2.shp",     proj4string=CRS("+proj=longlat +datum=WGS84 +no_defs"))
#Make a table with just long/lat and define the projection datum
points <- data.frame(x = m.unique$long, y = m.unique$lat)
coordinates(points) <- ~ x + y
proj4string(points)=CRS("+proj=longlat +datum=WGS84 +no_defs")
#extract the values of the points for the Florida polygon
over <- over(points, myshapefile)
#recombine everything to gather all data
total <- cbind(m.unique, over)
total
#Get rid of points that fell outside Florida polygons (will have NA instead of a polygon)
PointsWithinRegions <-total[!is.na(total$US_L3CODE), ]
head(PointsWithinRegions)
#We need a csv with only species, lat, long for MaxEnt input
FinalDataset <- cbind(as.character(PointsWithinRegions$species), PointsWithinRegions$lat, PointsWithinRegions$long)
head(FinalDataset)
write.csv(FinalDataset, "MaxEntPointsInput.csv")
