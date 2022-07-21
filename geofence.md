This post is about geofencing in ODK. To reproduce the work, you'll need some limited knowledge of how to use R. 

Geofencing is a process where geographical features, traces or shape-files are used as boundaries against which other geographical data are compared or tested. 

In practical terms, a user might provide software with a set of 'shape files', geographical polygons; then to identify (a) whether a newly collected GPS datum falls within any of these polygons and (b) if so, which ones. 

A good example of how a geofence can be used is within a clinical trial, where potential participants may only be eligible to take part if they live inside specified geographical limits, which can be described by multi-polygon shape files.

In a previous showcase, @Xiphware provided a neat solution for geofencing in ODK and proposed that a future improvement to that method may require some kind of decomposition of polygons. 

The approach described in this post is conceptually based on that principle, i.e. that at any resolution (i.e. 0.1 degrees, 0.01 degrees) all geospatial locations on Earth can be decomposed to a matrix of n^2 individual points, where n is 360/resolution

|resolution  | resolution (at equator) |n    |n^2 [globally] |  
| ---------- | ---------| --- | --- |  
| 1.0 degree | 111 km   |360  | 0.13 million|
| 0.1 degree | 11.1 km  |3600 | 13 million|
| 0.01 degree| 1.1 km   |36000 | 130 million |  

In practice it wouldn't make a lot of sense to make a grid for the whole of the Earth at very high resolution, as you're likely to be working on a more controlled area and the data set would get very big. So let's take Australia as an example. You'll find Australia within the bounds of latitude -40.0 to -10,0.01 and longitude 110 to 150.0

At 0.01 (1.1km) resolution, a decomposed grid of points covering the whole of Australia is about 12 million points. 

This is the start point for an example where we extract points that fall within a multi-polygon shape file and feed these in to ODK as the basis of a geofence. The shape files used here come from the Significant Urban Areas, Urban Centres and Localities of Australia. These are a bunch of open source shapefiles that draw polygons around major urban areas in Australia. They can be accessed [here](https://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.004July%202016?OpenDocument).

The first steps are done in R and use the library `sf` 

Code to reproduce here

`

`









