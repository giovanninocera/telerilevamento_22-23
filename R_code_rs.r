# This is the first remote sensing Rscript (22/23)


# Setting the working directory
setwd("C:/lab/")

# I want to use "raster" package
# install.packages("raster")

# Recalling the library in order to use raster package funtions 
library(raster)

# Importing raster file as RasterBrick
## brick() is used to import entire packages of data (ex. remoteS)
l2011 <- brick("p224r63_2011.grd")
l2011 # observing the object
# Reflectance index for 7 spectral bands (Landsat) ## Norteast Brazil
# b1 = blue
# b2 = green
# b3 = red
# b4 = NIR near infrared
# b5 = middle infrared
# b6 = thermic infrared
# b7 = middle infrared

# Plotting the object
plot(l2011) # default colors make images unclear

# Creating a new chromatic scale (color's vector) using colorRampPalette()
cl <- colorRampPalette(c("black", "grey", "light grey")) (100) 

# Darker colors indicate low values of refletance and vice versa
plot(l2011, col=cl)

# Observing just the blue band - B1_sre
plot(l2011$B1_sre, col=cl) # name
# or
plot(l2011[[1]], col=cl) # element

# Creating a chromatic scale for the blue band
clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre, col=clb)

# Exporting the image to the folder of the working directory
pdf("band1.pdf") # name of the new file in the WD folder
plot(l2011$B1_sre, col=clb)
dev.off() # to close graphic terminal
# or
png("band1.png")
plot(l2011$B1_sre, col=clb)
dev.off()

# Observing the green band - B2_sre - with green tonalities
clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col=clg)

# Changing graphical parameteres to plot 2 images one next to the other
par(mfrow=c(1,2)) # multiframe
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()

# Export multiframe
pdf("multiframeBG.pdf")
par(mfrow=c(1,2)) # multiframe
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()

# Reverting the multiframe
par(mfrow=c(2,1)) # multiframe
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()

# Multiframe 2x2
par(mfrow=c(2,2))
# blue
plot(l2011$B1_sre, col=clb)
# green
plot(l2011$B2_sre, col=clg)
# red
clr <- colorRampPalette(c("dark red", "red", "light pink"))
plot(l2011$B3_sre, col=clr)
# NIR
cln <- colorRampPalette(c("dark red", "orange", "yellow"))
plot(l2011$B4_sre, col=cln)


