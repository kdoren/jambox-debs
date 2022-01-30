#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=midipp
VERSION=2.1.1
TAG=v2.1.1

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout main
git submodule update --init
git pull --recurse-submodules
git checkout tags/${TAG}
cd ..

[[ -d ${PKGFOLDER} ]] && rm -rf ${PKGFOLDER}
mkdir -p ${PKGFOLDER}/debian
cp -r debian/* ${PKGFOLDER}/debian/
cp -r src/* ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`
