library(tidyverse)
library(sf)


# Shapefile from ABS:
# https://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.004July%202016?OpenDocument
map = read_sf("SUA_2016_AUST.shp/SUA_2016_AUST.shp")
map <- filter(map,str_detect(map$SUA_NAME16,"Not in any Significant Urban Area")==FALSE)

# Now create a grid of all global points at 0.1 degree resolution
global.0.1 <- expand_grid(lon = seq(-40.0,-10,0.01), lat = seq(110,150.0,0.01))

# Convert the points of the matrix to coordinates compatible with sf objects
pnts_sf <- st_as_sf(global.0.1, coords = c('lat', 'lon'), crs = st_crs(map))

# Find the intersections of the points and the template map
pnts.intersection <- pnts_sf %>% mutate(
  intersection = as.integer(st_intersects(geometry, map))
  , area = if_else(is.na(intersection), '', map$SUA_NAME16[intersection])
)


# Find only points that fall within the polygons
inside.polygons<-tibble(filter(pnts.intersection,area!="")) %>%
  mutate(
    geometry = as.character(geometry),
    geometry=str_sub(string = geometry,start = 3,end = str_length(geometry)-1),
    area = as.factor(area)
  ) %>%
  separate(geometry, c("lat", "lon"), ", ")


)


%>%
  mutate(
)


out<-


