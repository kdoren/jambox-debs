#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=hpsjam
VERSION=1.0.15
TAG=v1.0.15

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout main
git pull
git checkout ${TAG}
cd ..

if [ -d ${PKGFOLDER} ]; then
  rm -rf ${PKGFOLDER}/{build,icons,linux,mac,sounds,src,windows}
  rm -f ${PKGFOLDER}/HpsJam* ${PKGFOLDER}/{LICENSE,README.md}
fi

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
#tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`
