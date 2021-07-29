#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=alsa-utils
VERSION=1.2.5.1
TAG=v1.2.5.1

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout master
git pull
git checkout ${TAG}
cd ..

if [ -d ${PKGFOLDER} ]; then
  rm -rf ${PKGFOLDER}/debian/{alsa-utils,alsa-utils-udeb,tmp}
  rm -f ${PKGFOLDER}/debian/{debhelper-build-stamp,files} ${PKGFOLDER}/debian/autoreconf.* ${PKGFOLDER}/debian/*.debhelper ${PKGFOLDER}/debian/*.substvars ${PKGFOLDER}/debian/*.log
fi

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
#tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`

