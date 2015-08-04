#Niche Modeling Workshop - July 25th, 2015 - Botany Meeting, Edmonton
#Climate Layers Processing Script
#Charlotte Germain-Aubrey - email: cgermain@ufl.edu

#install the packages we need (only do it once)
install.packages("maptools")
install.packages("raster")
install.packages("rgdal")
install.packages("sp")
install.packages("maps")
install.packages("mapproj")

#load all the libraries we will need here (each time you oepn the script)
library(maptools)
library(raster)
library(rgdal)
library(sp)
library(maps)
library(mapproj)

#set the working directory
setwd("~/Desktop/NicheModelingWorkshop/MaxEnt_Example/")

#load the maps

alt_l <- raster("Bioclim/alt.bil")
#geo_l <- raster("Bioclim/geo.asc")
bio1_l <- raster("Bioclim/bio1.bil")
#bio2_l <- raster("Bioclim/bio2.bil")
#bio3_l <- raster("Bioclim/bio3.bil")
#bio4_l <- raster("Bioclim/bio4.bil")
#bio5_l <- raster("Bioclim/bio5.bil")
#bio6_l <- raster("Bioclim/bio6.bil")
#bio7_l <- raster("Bioclim/bio7.bil")
#bio8_l <- raster("Bioclim/bio8.bil")
#bio9_l <- raster("Bioclim/bio9.bil")
#bio10_l <- raster("Bioclim/bio10.bil")
#bio11_l <- raster("Bioclim/bio11.bil")
#bio12_l <- raster("Bioclim/bio12.bil")
#bio13_l <- raster("Bioclim/bio13.bil")
#bio14_l <- raster("Bioclim/bio14.bil")
#bio15_l <- raster("Bioclim/bio15.bil")
#bio16_l <- raster("Bioclim/bio16.bil")
#bio17_l <- raster("Bioclim/bio17.bil")
#bio18_l <- raster("Bioclim/bio18.bil")
#bio19_l <- raster("Bioclim/bio19.bil")

#make sure all layers are projected into the same datum
bio1_l
alt_l
#geo_l
#projection(geo_l) <- "+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs" 

# import polygons to delimit our maps to our region of interest
FL <- readShapePoly("FL/FLstate2.shp")

alt <- mask(alt_l, FL)
plot(alt_l)
plot(alt)
alt <- crop(alt, extent(FL))
plot(alt)
alt
writeRaster(alt, "PresentLayers/alt.asc", format="ascii")

bio1 <- mask(bio1_l, FL)
bio1 <- crop(bio1, extent(FL))
writeRaster(bio1, "PresentLayers/bio1.asc", format="ascii")
# 
# bio2 <- mask(bio2_l, FL)
# bio2 <- crop(bio2, extent(FL))
# writeRaster(bio2, "PresentLayers/bio2.asc", format="ascii")
# 
# bio3 <- mask(bio3_l, FL)
# bio3 <- crop(bio3, extent(FL))
# writeRaster(bio3, "PresentLayers/bio3.asc", format="ascii")
# 
# bio4 <- mask(bio4_l, FL)
# bio4 <- crop(bio4, extent(FL))
# writeRaster(bio4, "PresentLayers/bio4.asc", format="ascii")
# 
# bio5 <- mask(bio5_l, FL)
# bio5 <- crop(bio5, extent(FL))
# writeRaster(bio5, "PresentLayers/bio5.asc", format="ascii")
# 
# bio6 <- mask(bio6_l, FL)
# bio6 <- crop(bio6, extent(FL))
# writeRaster(bio6, "PresentLayers/bio6.asc", format="ascii")
# 
# bio7 <- mask(bio7_l, FL)
# bio7 <- crop(bio7, extent(FL))
# writeRaster(bio7, "PresentLayers/bio7.asc", format="ascii")
# 
# bio8 <- mask(bio8_l, FL)
# bio8 <- crop(bio8, extent(FL))
# writeRaster(bio8, "PresentLayers/bio8.asc", format="ascii")
# 
# bio9 <- mask(bio9_l, FL)
# bio9 <- crop(bio9, extent(FL))
# writeRaster(bio9, "PresentLayers/bio9.asc", format="ascii")
# 
# bio10 <- mask(bio10_l, FL)
# bio10 <- crop(bio10, extent(FL))
# writeRaster(bio10, "PresentLayers/bio10.asc", format="ascii")
# 
# bio11 <- mask(bio11_l, FL)
# bio11 <- crop(bio11, extent(FL))
# writeRaster(bio11, "PresentLayers/bio11.asc", format="ascii")
# 
# bio12 <- mask(bio12_l, FL)
# bio12 <- crop(bio12, extent(FL))
# writeRaster(bio12, "PresentLayers/bio12.asc", format="ascii")
# 
# bio13 <- mask(bio13_l, FL)
# bio13 <- crop(bio13, extent(FL))
# writeRaster(bio13, "PresentLayers/bio13.asc", format="ascii")
# 
# bio14 <- mask(bio14_l, FL)
# bio14 <- crop(bio14, extent(FL))
# writeRaster(bio14, "PresentLayers/bio14.asc", format="ascii")
# 
# bio15 <- mask(bio15_l, FL)
# bio15 <- crop(bio15, extent(FL))
# writeRaster(bio15, "PresentLayers/bio15.asc", format="ascii")
# 
# bio16 <- mask(bio16_l, FL)
# bio16 <- crop(bio16, extent(FL))
# writeRaster(bio16, "PresentLayers/bio16.asc", format="ascii")
# 
# bio17 <- mask(bio17_l, FL)
# bio17 <- crop(bio17, extent(FL))
# writeRaster(bio17, "PresentLayers/bio17.asc", format="ascii")
# 
# bio18 <- mask(bio18_l, FL)
# bio18 <- crop(bio18, extent(FL))
# writeRaster(bio18, "PresentLayers/bio18.asc", format="ascii")
# 
# bio19 <- mask(bio19_l, FL)
# bio19 <- crop(bio19, extent(FL))
# writeRaster(bio19, "PresentLayers/bio19.asc", format="ascii")
# 
# geo <- mask(geo_l, FL)
# geo <- crop(geo, extent(FL))
# writeRaster(geo, "PresentLayers/geo.asc", format="ascii")

#### Now let's do a correlation analysis to try and reduce the number of layers for MaxEnt


#### Here we upload the cropped bioclim layers####
### Note: you won't need this step if you process all the biolcim layers before ###
bio2 <- raster("PresentLayers/bio2.asc")
bio3 <- raster("PresentLayers/bio3.asc")
bio4 <- raster("PresentLayers/bio4.asc")
bio5 <- raster("PresentLayers/bio5.asc")
bio6 <- raster("PresentLayers/bio6.asc")
bio7 <- raster("PresentLayers/bio7.asc")
bio8 <- raster("PresentLayers/bio8.asc")
bio9 <- raster("PresentLayers/bio9.asc")
bio10 <- raster("PresentLayers/bio10.asc")
bio11 <- raster("PresentLayers/bio11.asc")
bio12 <- raster("PresentLayers/bio12.asc")
bio13 <- raster("PresentLayers/bio13.asc")
bio14 <- raster("PresentLayers/bio14.asc")
bio15 <- raster("PresentLayers/bio15.asc")
bio16 <- raster("PresentLayers/bio16.asc")
bio17 <- raster("PresentLayers/bio17.asc")
bio18 <- raster("PresentLayers/bio18.asc")
bio19 <- raster("PresentLayers/bio19.asc")


stack <- stack(bio1, bio2, bio3, bio4, bio5, bio6, bio7, bio8, bio9, bio10, bio11, bio12, bio13, bio14, bio15, bio16, bio17, bio18, bio19)
corr <- layerStats(stack, 'pearson', na.rm=TRUE)
c <- corr$`pearson correlation coefficient`
write.csv(c, "correlationBioclim.csv")


