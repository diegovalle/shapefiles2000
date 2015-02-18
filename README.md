Shapefiles of Manzanas and AGEBs from the 2000 Mexican Census
===============================================================

Script to download shapefiles from the 2000 Mexican Census

To run:

```
download.sh
```

Requirements:

* Casperjs

So far it downloads all the 2000 census shapefiles, but there is a projection issue when combining them.

TODO:

* Figure out the (zone)[http://spatialreference.org/ref/epsg/26716/] (11-16) each municipio belongs to (using its centroid?)
