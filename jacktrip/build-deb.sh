#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=jacktrip
VERSION=1.2.2
TAG=v1.2.2

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout tags/${TAG}
cd ..

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`
