#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=qjacktrip
VERSION=1.3.0
TAG=v1.3.0-124-gac6c2f7
export GITREV=1.3.0-124-gac6c2f7

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout qjacktrip
git checkout ${TAG}
cd ..

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}
cp qjacktrip.desktop ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`
