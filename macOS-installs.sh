#!/usr/bin/env bash

echo "Downloading bash 5.0"
mkdir temp-install
cd temp-install
curl 'http://ftp.gnu.org/gnu/bash/bash-5.0.tar.gz' -O
tar -xzvf bash-5.0.tar.gz
cd bash-5.0

echo "Downloading and applying patches"
cd bash-5.0
mkdir patches
cd patches
curl 'https://ftp.gnu.org/gnu/bash/bash-5.0-patches/bash50-[001-016]' -O
cd ..
patch -p0 -i patches/bash50-001
patch -p0 -i patches/bash50-002
patch -p0 -i patches/bash50-003
patch -p0 -i patches/bash50-004
patch -p0 -i patches/bash50-005
patch -p0 -i patches/bash50-006
patch -p0 -i patches/bash50-007
patch -p0 -i patches/bash50-008
patch -p0 -i patches/bash50-009
patch -p0 -i patches/bash50-010
patch -p0 -i patches/bash50-011
patch -p0 -i patches/bash50-012
patch -p0 -i patches/bash50-013
patch -p0 -i patches/bash50-014
patch -p0 -i patches/bash50-015
patch -p0 -i patches/bash50-016

echo "Building bash"
./configure
make

echo "Installing bash"
make install

echo "Bash installed in /usr/local/bin/bash"

rm -rf temp-install
