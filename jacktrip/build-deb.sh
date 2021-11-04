#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=jacktrip
VERSION=1.4.0
TAG=v1.4.0

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout main
git submodule update --init
git pull --recurse-submodules
git checkout tags/${TAG}
cd ..

if [ -d ${PKGFOLDER} ]; then
  rm -rf ${PKGFOLDER}/{builddir,cross,docs,documentation,externals,faust-src,LICENSES,linux,macos,papers,scripts,src,subprojects,tests,win}
  rm -f ${PKGFOLDER}/*.txt ${PKGFOLDER}/*.pro ${PKGFOLDER}/LICENSE* ${PKGFOLDER}/meson* ${PKGFOLDER}/INSTALL* ${PKGFOLDER}/{Doxyfile,jacktrip+doxygen,meson.build,mkdocs.yml}
fi

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
cp jacktrip.desktop ${PKGFOLDER}
# tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`
