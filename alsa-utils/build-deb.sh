#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=alsa-utils
VERSION=1.2.5.1
TAG=v1.2.5.1

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout master
git submodule update --init
git pull --recurse-submodules
git checkout tags/${TAG}
cd ..

[[ -d ${PKGFOLDER} ]] && rm -rf ${PKGFOLDER}
mkdir -p ${PKGFOLDER}/debian
cp -r debian/* ${PKGFOLDER}/debian/
cp -r src/* ${PKGFOLDER}
#tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`

