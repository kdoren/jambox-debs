#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=sonobus
VERSION=1.4.5
TAG=1.4.5

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout tags/${TAG}
cd ..

if [ -d ${PKGFOLDER} ]; then
  rm -rf ${PKGFOLDER}/{build,doc,localization,scripts,images,mobile,Source,JuceLibraryCode,obj-arm-linux-gnueabihf,deps,linux,release,snap}
  rm -f ${PKGFOLDER}/*.sh ${PKGFOLDER}/{SonoBus.jucer,CMakeLists.txt,LICENSE,README.md}
fi

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`
