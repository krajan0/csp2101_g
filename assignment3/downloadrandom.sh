#Karrthik Rajan
#Student Number: 10452682

#!/bin/bash

#url to image database
echo "Starting images download : ..... Connecting to ecu.edu.au ..."
FULLURL="https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152"
URL="https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/"

#prefix for all images
PREFIX="DSC0"

#extract paramters by user 
NO_OF_IMAGES=$1

#loop images in the range
IMAGES_DOWNLOADED=0
echo "Preparing to download  $NO_OF_IMAGES Random Images ..."
for (( i=1533; i<=2042; i++ ))
    do   #check if number of downloaded images is equal to the requested images
       if [ $IMAGES_DOWNLOADED -ge $NO_OF_IMAGES ]; then
            break
       fi
       #Generate a random number in the range  1533-2042
       RANDOMNUM=$(awk 'BEGIN{srand();print int(rand()*(2042-1533))+1533 }')
       IMAGE="$PREFIX$RANDOMNUM"
       IMAGENAME="$PREFIX$RANDOMNUM.jpg"
       FULLIMAGEURL="$URL$PREFIX$RANDOMNUM.jpg"
       if wget -q --method=HEAD $FULLIMAGEURL;
            then
               if  [ -f ./downloads/$IMAGENAME ]; then
                    echo "$IMAGENAME File Already Exists"
                    else
                      IMAGE_SIZE=$(curl -sI ${FULLIMAGEURL} | grep -i Content-Length | awk '{print $2}' )
                      KB=$(awk -v DIVIDER=1000 -v RST=$IMAGE_SIZE 'BEGIN { printf "%.2f",  ( RST / DIVIDER ) }')
                      echo "Downloading ${IMAGE}, with file name ${IMAGENAME}, with a file size of ${KB} KB ... File Download"
                      wget -q --no-clobber -P ./downloads $FULLIMAGEURL;
                      let "IMAGES_DOWNLOADED+=1" 
                      echo "Complete"
               fi
        fi
done
echo "PROGRAM FINISHED"

