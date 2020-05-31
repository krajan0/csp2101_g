#Karrthik Rajan
#Student Number: 10452682

#!/bin/bash

#url of image database
echo "Starting images download : ..... Connecting to ecu.edu.au ..."
FULLURL="https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152"
URL="https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/"

#Prefix for all images
PREFIX="DSC0"

#extract paramters by user 
STARTRANGE=$1
ENDRANGE=$2

#loop images in the range
for (( i=$STARTRANGE; i<=$ENDRANGE; i++ ))
    do
       IMAGE="$PREFIX$i"
       IMAGENAME="$PREFIX$i.jpg"
       FULLIMAGEURL="$URL$PREFIX$i.jpg"
       if wget -q --method=HEAD $FULLIMAGEURL;
            then
               if  [ -f ./downloads/$IMAGENAME ]; then
                    echo "$IMAGENAME File Already Exists"
                    else
                      IMAGE_SIZE=$(curl -sI ${FULLIMAGEURL} | grep -i Content-Length | awk '{print $2}' )
                      KB=$(awk -v DIVIDER=1000 -v RST=$IMAGE_SIZE 'BEGIN { printf "%.2f",  ( RST / DIVIDER ) }')
                      echo "Downloading ${IMAGE}, with file name ${IMAGENAME}, with a file size of ${KB} KB ... File Download"
                     #download file
                      wget -q --no-clobber -P ./downloads $FULLIMAGEURL;
                      echo "Complete"
               fi
        fi
done
echo "PROGRAM FINISHED"
