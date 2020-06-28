#!/bin/bash
# (c) 2020 F. Köppl

# Set how many minutes each ensemble should be recorded
eti_length_mins=5


let dab_frames=($eti_length_mins*2500)

channels=('5A' '5B' '5C' '5D' '6A' '6B' '6C' '6D' '7A' '7B' '7C' '7D' '8A' '8B' '8C' '8D' '9A' '9B' '9C' '9D' '10A' '10B' '10C' '10D' '11A' '11B' '11C' '11D' '12A' '12B' '12C' '12D' '13A' '13B' '13C' '13D' '13E' '13F'	)

#channels=('11C' '11D' '12A')

timestamp=$(date "+%Y%m%d-%H%M")

for i in "${channels[@]}"
do
	echo -------------------------------------------
	echo  Kanal $i
	echo -------------------------------------------
	./etirec.sh $i $dab_frames

done

