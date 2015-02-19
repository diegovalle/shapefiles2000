Shapefiles of Manzanas and AGEBs from the 2000 Mexican Census
===============================================================

Script to download shapefiles from the 2000 Mexican Census

To run:

```
download.sh
```

Once finished the shapefiles will be in the _out_ directory

Requirements:

* Casperjs
* R
* ogr2ogr

Erros:

* In the AGEB and Manzanas shapefile Colima is floating south of Chiapas, this entirely the fault of the INEGI
* In the Manzanas shapefile some urban manazanas are floating in the Atlantic and Pacific oceans, this happend because the INEGI didn't specify which UTM zone they used for each shapefile.

