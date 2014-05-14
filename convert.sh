#!/bin/bash
echo "--------------------"
for i in *.djvu; do
	mkdir -p ${i%%.*}/original
	mkdir -p ${i%%.*}/thumbs
	mkdir ${i%%.*}/dzi
	echo "converting djvu for : ${i%%.*}"
	ddjvu -eachpage -format=tiff ${i%%.*}.djvu ${i%%.*}/original/%d.tiff
	echo "creating jpeg for : ${i%%.*}"
	mogrify -format jpg ${i%%.*}/original/*.tiff -compress none
	rm ${i%%.*}/original/*.tiff
	echo "creating thumbs for : ${i%%.*}"
	mogrify -resize 90 -path ${i%%.*}/thumbs ${i%%.*}/original/*.jpg
	echo "creating dzi for : ${i%%.*}"
	java -jar dz_converter.jar -verbose -outputdir ${i%%.*}/dzi/ ${i%%.*}/original/*.jpg
	echo "writing js for : ${i%%.*}"
	php ../php/application.php inputdir ${i%%.*} 
	rm -rf ${i%%.*}/original
done
