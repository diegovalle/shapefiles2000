#casperjs download.js

mkdir -p zip
mkdir -p out

#for f in zip/*.zip; do unzip -d "${f%*.zip}" "$f"; done

file_manzanas="out/mexico_2000_manzanas.shp"
file_ageb="out/mexico_2000_ageb.shp"

cd municipios
Rscript get_zone.R
cd ..

for file in $(find zip -wholename "*MANZANAS*.shp" |  sort -n -t'/' -k2,2)
do
  echo $(dirname $file)/$(basename -s .shp $file).prj
  if [ -f "out/mexico_2000_manzanas.shp" ]
      then
           ogr2ogr -overwrite -a_srs $(dirname $file)/$(basename -s .shp $file).prj out/temp.shp $file -t_srs "+proj=longlat +ellps=WGS84 +no_defs +towgs84=0,0,0"
           ogr2ogr -update -append "out/mexico_2000_manzanas.shp" out/temp.shp -f "esri shapefile" 
          
      else
           ogr2ogr -overwrite -a_srs $(dirname $file)/$(basename -s .shp $file).prj out/temp.shp $file -t_srs "+proj=longlat +ellps=WGS84 +no_defs +towgs84=0,0,0"
           ogr2ogr -f "esri shapefile" "out/mexico_2000_manzanas.shp" out/temp.shp
  fi
done

#for file in $(find zip -wholename "*AGEB*.shp" |  sort -n -t'/' -k2,2)
#do
#  echo $file
#  if [ -f "$file_ageb" ]
#      then
#          ogr2ogr -update -append "$file_ageb" $file -f "esri shapefile"
#          
#      else
#          ogr2ogr -f "esri shapefile" "$file_ageb" $file
#  fi
#done

curl -o out/ageb.zip http://mapserver.inegi.org.mx/MGN/mgau2000.zip
unzip out/ageb.zip -d out/

rm out/ageb.zip
rm out/temp.*
