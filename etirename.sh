#!/bin/bash
# (c) 2020 F. Köppl

if [ $# -eq 0 ]
  then
    echo "Usage: etirename.sh <filename.eti>"
    exit 0
fi

# Check if file is not empty
if [ -s $1 ]
then

	# Ensemble ID
	EID=$(etisnoop -n 50 -i $1 | grep 'Ensemble ID: 0x.' | sort | uniq | head -1 | sed -e 's/^.*Ensemble ID: 0x//g' | sed -e 's/[^a-zA-Z0-9\\.\\-]/_/g')
	echo Ensemble ID: $EID

	# Ensemble Label
	ELABEL=$(etisnoop -n 50 -i $1 | grep -A 2 'Ensemble ID:' | grep 'Label: ' | sort | uniq | head -1  | sed -e 's/^.*Label: "//g' | sed -e 's/".*$//g'  | sed -e 's/[^a-zA-Z0-9\\.\\-]/_/g' )
	echo Ensemble Label: $ELABEL
	echo 

	# Rename file
	echo ----------------------------------
	echo Renaming file: ${EID}_${ELABEL}_$1
	mv $1 ${EID}_${ELABEL}_$1

else
        rm -f $1
	echo --------------------------------
	echo No DAB Ensemble found in file $1
	echo Removing empty file.
	echo --------------------------------

fi



