#!/bin/bash
#
# to build on Raspberry Pi requires:
# 
# # install nodejs
# curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
# sudo bash nodesource_setup.sh
# sudo apt install nodejs
#
# # install yarn
# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# sudo apt update && sudo apt install yarn
#
# # install fpm
# sudo apt-get install ruby-full
# sudo gem install fpm

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=jamtrip
VERSION=0.1.3
DEBIAN_REVISION=0
# TAG=v0.1.3

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
[[ -n "$TAG" ]] && git checkout tags/${TAG}
cd ..

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
#tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}
/bin/cp -f ../package.json .
export NODE_OPTIONS=--experimental-worker
export USE_SYSTEM_FPM=true
export ITERATION=${DEBIAN_REVISION}
yarn
yarn package-pi-deb

