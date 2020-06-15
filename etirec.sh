#!/bin/bash
# (c) 2019 F. Köppl

if [ $# -eq 0 ]
  then
    echo "Usage: etirec.sh <channel name>"
    exit 0
fi

timestamp=$(date "+%Y%m%d-%H%M")

case "$1" in

   '5A' )
	frequency="174928000"
	;;
   '5B' )
	frequency="176640000"
	;;
   '5C' )
	frequency="178352000"
	;;
   '5D' )
	frequency="180064000"
	;;
   '6A' )
	frequency="181936000"
	;;
   '6B' )
	frequency="183648000"
	;;
   '6C' )
	frequency="185360000"
	;;
   '6D' )
	frequency="187072000"
	;;
   '7A' )
	frequency="188928000"
	;;
   '7B' )
	frequency="190640000"
	;;
   '7C' )
	frequency="192352000"
	;;
   '7D' )
	frequency="194064000"
	;;
   '8A' )
	frequency="195936000"
	;;
   '8B' )
	frequency="197648000"
	;;
   '8C' )
	frequency="199360000"
	;;
   '8D' )
	frequency="201072000"
	;;
   '9A' )
	frequency="202928000"
	;;
   '9B' )
	frequency="204640000"
	;;
   '9C' )
	frequency="206352000"
	;;
   '9D' )
	frequency="208064000"
	;;
 '10A' )
	frequency="209936000"
	;;
 '10B' )
	frequency="211648000"
	;;
 '10C' )
	frequency="213360000"
	;;
 '10D' )
	frequency="215072000"
	;;
 '11A' )
	frequency="216928000"
	;;
 '11B' )
	frequency="218640000"
	;;
 '11C' )
	frequency="220352000"
	;;
 '11D' )
	frequency="222064000"
	;;
 '12A' )
	frequency="223936000"
	;;
 '12B' )
	frequency="225648000"
	;;
 '12C' )
	frequency="227360000"
	;;
 '12D' )
	frequency="229072000"
	;;
 '13A' )
	frequency="230784000"
	;;
 '13B' )
	frequency="232496000"
	;;
 '13C' )
	frequency="234208000"
	;;
 '13D' )
	frequency="235776000"
	;;
 '13E' )
	frequency="237488000"
	;;
 '13F' )
	frequency="239200000"
	;;

esac

# echo dab2eti $frequency $2_$1_$timestamp.eti
# ./dab2eti $frequency > $1_$timestamp.eti
echo eti-cmdline-rtlsdr -C $1 $1_$timestamp.eti
./eti-cmdline-rtlsdr -C $1 > $1_$timestamp.eti

echo ------------------------------
echo finished recording!
echo ------------------------------

# Ensemble ID
#etisnoop -n 50 -i temp.eti | grep 'Ensemble ID: 0x.' | sort | uniq | sed -e 's/^.*Ensemble ID: //g' | sed -e 's/ (Country.*$//g'
EID=$(etisnoop -n 50 -i $1_$timestamp.eti | grep 'Ensemble ID: 0x.' | sort | uniq | sed -e 's/^.*Ensemble ID: 0x//g')
#| sed -e 's/ (Country.*$//g')
echo Ensemble ID: $EID

# Ensemble Label
ELABEL=$(etisnoop -n 50 -i $1_$timestamp.eti | grep -A 2 'Ensemble ID:' | grep 'Label: ' | sort | uniq | sed -e 's/^.*Label: "//g' | sed -e 's/".*$//g'  | sed -e 's/[^a-zA-Z0-9\\.\\-]/_/g' )
echo Ensemble Label: $ELABEL
echo .

# Rename file
#mv $1_$timestamp.eti ${EID}_${ELABEL}_$1_$timestamp.eti
echo Recorded file: ${EID}_${ELABEL}_$1_$timestamp.eti
mv $1_$timestamp.eti ${EID}_${ELABEL}_$1_$timestamp.eti





