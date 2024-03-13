#!/bin/bash
sudo apt-get update
sudo apt-get install libsndfile-dev
sudo apt-get install libfftw3-dev
sudo apt-get install rtl-sdr
sudo apt-get install libsamplerate-dev
 
sudo apt-get install git
sudo apt-get install cmake
sudo apt-get install librtlsdr-dev

# eti-stuff does not work with too new versions of cmake
# install a compatible
# manual found on: https://www.electronicjunkies.net/index.php/2021/04/13/install-any-version-of-cmake-on-ubuntu/

# Remove previous cmake versions
# sudo apt remove cmake
# sudo apt purge --auto-remove cmake

# sudo apt-get install build-essential
# wget http://www.cmake.org/files/v3.15/cmake-3.15.1.tar.gz
# tar xf cmake-3.15.1.tar.gz

# cd cmake-3.15.1
# ./configure
# make
# Then to install it to your system finally do 
# sudo make install 

# Do this to refresh your console 
# hash -r

# Then finally check with
cmake --version 

git clone https://github.com/fkoeppl/eti-stuff
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

