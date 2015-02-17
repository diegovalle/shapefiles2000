casperjs download.js

mkdir -p zip
mkdir -p out

for f in zip/*.zip; do unzip -d "${f%*.zip}" "$f"; done

file_manzanas="out/mexico_2000_manzanas.shp"
file_ageb="out/mexico_2000_ageb.shp"

for file in $(find zip -wholename "*MANZANAS*.shp" |  sort -n -t'/' -k2,2)
do
  echo $file
  if [ -f "$file_manzanas" ]
      then
          ogr2ogr -update -append "$file_manzanas" $file -f "esri shapefile" 
          
      else
          ogr2ogr -f "esri shapefile" "$file_manzanas" $file
  fi
done

for file in $(find zip -wholename "*AGEB*.shp" |  sort -n -t'/' -k2,2)
do
  echo $file
  if [ -f "$file_ageb" ]
      then
          ogr2ogr -update -append "$file_ageb" $file -f "esri shapefile"
          
      else
          ogr2ogr -f "esri shapefile" "$file_ageb" $file
  fi
done
