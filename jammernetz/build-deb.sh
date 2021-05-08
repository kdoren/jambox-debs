#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=jammernetz
VERSION=2.1.2
TAG=2.1.2

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout tags/${TAG}
cd ..

#if [ -d ${PKGFOLDER} ]; then
#  rm -rf ${PKGFOLDER}/{aws,builds,Client,cmake,common,modules,projucer,third_party,obj-arm-linux-gnueabihf,Server}
#  rm -f ${PKGFOLDER}/*.sh ${PKGFOLDER}/{azure-pipelines.yml,buildWindows.bat,client-screenshot.PNG,CMakeLists.txt,conanfile.txt,LICENSE.md,RandomNumbers.bin,README.md}
#fi

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`

