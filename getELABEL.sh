#!/bin/bash

# Ensemble ID
EID=$(etisnoop -n 50 -i $1 | grep 'Ensemble ID: 0x.' | sort | uniq | head -1 | sed -e 's/^.*Ensemble ID: 0x//g' | sed -e 's/[^a-zA-Z0-9\\.\\-]/_/g')
echo -----------------
echo Ensemble ID: $EID
echo 

# Ensemble Label
ELABEL=$(etisnoop -n 50 -i $1 | grep -A 2 'Ensemble ID:' | grep 'Label: ' | sort | uniq | head -1  | sed -e 's/^.*Label: "//g' | sed -e 's/".*$//g'  | sed -e 's/[^a-zA-Z0-9\\.\\-]/_/g' )
echo -----------------
echo Ensemble Label: $ELABEL
echo 




