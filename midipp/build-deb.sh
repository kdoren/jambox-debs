#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=midipp
VERSION=2.1.1
TAG=v2.1.1

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout main
git pull
git checkout ${TAG}
git submodule update --init
cd ..

if [ -d ${PKGFOLDER} ]; then
  rm -rf ${PKGFOLDER}/{build,MidiPlayerPro.iconset,android,icons,libumidi,src}
  rm -f ${PKGFOLDER}/midipp* ${PKGFOLDER}/{LICENSE,README.md}
fi

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
#echo -e "SHLIB_SHFLAGS=-Wl,--soname=lib\${LIB}.so.\${SHLIB_SOVERSION}" >> ${PKGFOLDER}/libumidi/Makefile
#tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`
