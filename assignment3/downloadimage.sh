#Karrthik Rajan
#Student Number: 10452682

#!/bin/bash

#url of image database
URL="https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/"
PARAMS=$1

#concat 1st parameter  with .jpg  to get full image name
IMAGENAME="${PARAMS}.jpg"

#existing file check
if  [ -f ./downloads/$IMAGENAME ]; then
  echo "File Already Exists"
  exit
fi

#image size
IMAGE_SIZE=$(curl -sI ${URL}${IMAGENAME} | grep -i Content-Length | awk '{print $2}' )

#convert image size
KB=$(awk -v DIVIDER=1000 -v RST=$IMAGE_SIZE 'BEGIN { print ( RST / DIVIDER ) }')

#file downloaded notification
echo "Downloading ${PARAMS}, with file name ${IMAGENAME}, with a file size of ${KB} KB ….File Download"

#download file
wget -q --no-clobber -P ./downloads ${URL}${IMAGENAME};
echo "Complete"
echo "PROGRAM FINISHED"