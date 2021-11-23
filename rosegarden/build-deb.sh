#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=rosegarden
VERSION=21.06.1
TAG=debian/1%21.06.1-1

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout master
git pull
git checkout ${TAG}
cd ..

[[ -d ${PKGFOLDER} ]] && rm -rf ${PKGFOLDER}
mkdir -p ${PKGFOLDER}/debian
#cp -r debian/* ${PKGFOLDER}/debian/
cp -r src/* ${PKGFOLDER}
#tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`
