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
setwd("~/Desktop/NicheModelingWorkshop/Charlotte/“) 
      
      #load the maps
      
      alt_lF <- raster("Bioclim/alt.bil")
      geo_lF <- raster("Bioclim/geo.asc")
      bio1_lF <- raster("FutureLayers/cc85bi701.tif")
      bio2_lF <- raster("FutureLayers/cc85bi702.tif")
      bio3_lF <- raster("FutureLayers/cc85bi703.tif")
      bio4_lF <- raster("FutureLayers/cc85bi704.tif")
      bio5_lF <- raster("FutureLayers/cc85bi705.tif")
      bio6_lF <- raster("FutureLayers/cc85bi706.tif")
      bio7_lF <- raster("FutureLayers/cc85bi707.tif")
      bio8_lF <- raster("FutureLayers/cc85bi708.tif")
      bio9_lF <- raster("FutureLayers/cc85bi709.tif")
      bio10_lF <- raster("FutureLayers/cc85bi7010.tif")
      bio11_lF <- raster("FutureLayers/cc85bi7011.tif")
      bio12_lF <- raster("FutureLayers/cc85bi7012.tif")
      bio13_lF <- raster("FutureLayers/cc85bi7013.tif")
      bio14_lF <- raster("FutureLayers/cc85bi7014.tif")
      bio15_lF <- raster("FutureLayers/cc85bi7015.tif")
      bio16_lF <- raster("FutureLayers/cc85bi7016.tif")
      bio17_lF <- raster("FutureLayers/cc85bi7017.tif")
      bio18_lF <- raster("FutureLayers/cc85bi7018.tif")
      bio19_lF <- raster("FutureLayers/cc85bi7019.tif")
      
      #make sure all layers are projected into the same datum
      bio2_lF
      alt_lF
      geo_lF
      projection(geo_lF) <- "+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs" 
      
      # import polygons to delimit our maps to our region of interest
      FL <- readShapePoly("FL/FLstate2.shp")
      
      altF <- mask(alt_lF, FL)
      plot(alt_lF)
      plot(altF)
      altF <- crop(altF, extent(FL))
      plot(altF)
      altF
      writeRaster(altF, "FutureLayers/alt.asc", format="ascii")
      
      bio1F <- mask(bio1_lF, FL)
      bio1F <- crop(bio1F, extent(FL))
      writeRaster(bio1F, "FutureLayers/bio1.asc", format="ascii")
      
      bio2F <- mask(bio2_lF, FL)
      bio2F <- crop(bio2F, extent(FL))
      writeRaster(bio2F, "FutureLayers/bio2.asc", format="ascii")
      
      bio3F <- mask(bio3_lF, FL)
      bio3F <- crop(bio3F, extent(FL))
      writeRaster(bio3F, "FutureLayers/bio3.asc", format="ascii")
      
      bio4F <- mask(bio4_lF, FL)
      bio4F <- crop(bio4F, extent(FL))
      writeRaster(bio4F, "FutureLayers/bio4.asc", format="ascii")
      
      bio5F <- mask(bio5_lF, FL)
      bio5F <- crop(bio5F, extent(FL))
      writeRaster(bio5F, "FutureLayers/bio5.asc", format="ascii")
      
      bio6F <- mask(bio6_lF, FL)
      bio6F <- crop(bio6F, extent(FL))
      writeRaster(bio6F, "FutureLayers/bio6.asc", format="ascii")
      
      bio7F <- mask(bio7_lF, FL)
      bio7F <- crop(bio7F, extent(FL))
      writeRaster(bio7F, "FutureLayers/bio7.asc", format="ascii")
      
      bio8F <- mask(bio8_lF, FL)
      bio8F <- crop(bio8F, extent(FL))
      writeRaster(bio8F, "FutureLayers/bio8.asc", format="ascii")
      
      bio9F <- mask(bio9_lF, FL)
      bio9F <- crop(bio9F, extent(FL))
      writeRaster(bio9F, "FutureLayers/bio9.asc", format="ascii")
      
      bio10F <- mask(bio10_lF, FL)
      bio10F <- crop(bio10F, extent(FL))
      writeRaster(bio10F, "FutureLayers/bio10.asc", format="ascii")
      
      bio11F <- mask(bio11_lF, FL)
      bio11F <- crop(bio11F, extent(FL))
      writeRaster(bio11F, "FutureLayers/bio11.asc", format="ascii")
      
      bio12F <- mask(bio12_lF, FL)
      bio12F <- crop(bio12F, extent(FL))
      writeRaster(bio12F, "FutureLayers/bio12.asc", format="ascii")
      
      bio13F <- mask(bio13_lF, FL)
      bio13F <- crop(bio13F, extent(FL))
      writeRaster(bio13F, "FutureLayers/bio13.asc", format="ascii")
      
      bio14F <- mask(bio14_lF, FL)
      bio14F <- crop(bio14F, extent(FL))
      writeRaster(bio14F, "FutureLayers/bio14.asc", format="ascii")
      
      bio15F <- mask(bio15_lF, FL)
      bio15F <- crop(bio15F, extent(FL))
      writeRaster(bio15F, "FutureLayers/bio15.asc", format="ascii")
      
      bio16F <- mask(bio16_lF, FL)
      bio16F <- crop(bio16F, extent(FL))
      writeRaster(bio16F, "FutureLayers/bio16.asc", format="ascii")
      
      bio17F <- mask(bio17_lF, FL)
      bio17F <- crop(bio17F, extent(FL))
      writeRaster(bio17F, "FutureLayers/bio17.asc", format="ascii")
      
      bio18F <- mask(bio18_lF, FL)
      bio18F <- crop(bio18F, extent(FL))
      writeRaster(bio18F, "FutureLayers/bio18.asc", format="ascii")
      
      bio19F <- mask(bio19_lF, FL)
      bio19F <- crop(bio19F, extent(FL))
      writeRaster(bio19F, "FutureLayers/bio19.asc", format="ascii")
      
      geoF <- mask(geo_lF, FL)
      geoF <- crop(geoF, extent(FL))
      writeRaster(geoF, "FutureLayers/geo.asc", format="ascii")
    
      
      
      