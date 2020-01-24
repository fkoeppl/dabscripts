#!/bin/bash

# Ensamble ID
#etisnoop -n 50 -i temp.eti | grep 'Ensemble ID: 0x.' | sort | uniq | sed -e 's/^.*Ensemble ID: //g' | sed -e 's/ (Country.*$//g'
EID=$(etisnoop -n 50 -i temp.eti | grep 'Ensemble ID: 0x.' | sort | uniq | sed -e 's/^.*Ensemble ID: 0x//g')
#| sed -e 's/ (Country.*$//g')
echo -----------------
echo Ensemble ID: $EID
echo .

# Ensamble Label
ELABEL=$(etisnoop -n 50 -i temp.eti | grep -A 2 'Ensemble ID:' | grep 'Label: ' | sort | uniq | sed -e 's/^.*Label: "//g' | sed -e 's/".*$//g')
echo -----------------
echo Ensemble Label: $ELABEL
echo .

#etisnoop -n 50 -i temp.eti | grep -A 2 'Ensemble ID:' | grep 'Label: ' | sort | uniq | sed -e 's/^.*Label: "//g' | sed -e 's/".*$//g'






