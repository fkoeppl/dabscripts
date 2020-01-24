#!/bin/bash
sudo apt-get update
sudo apt-get install libsndfile-dev
sudo apt-get install libfftw3-dev
sudo apt-get install rtl-sdr
sudo apt-get install libsamplerate-dev
 
sudo apt-get install git
sudo apt-get install cmake
sudo apt-get install librtlsdr-dev
 
git clone https://github.com/JvanKatwijk/eti-stuff
cd eti-stuff
cd eti-cmdline
mkdir build
cd build
cmake .. -DRTLSDR=ON
make
 
cd ..
cd ..
 
sudo apt-get install libfaad2
sudo apt-get install autoconf
sudo apt-get install libfaad-dev
 
 
git clone https://github.com/Opendigitalradio/etisnoop.git
cd etisnoop
./bootstrap.sh
./configure
make
sudo make install

