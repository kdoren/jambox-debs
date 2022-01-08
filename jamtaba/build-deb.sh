#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=jamtaba
VERSION=2.1.16
TAG=v2.1.16

#VST3SDK_TAG=v3.7.1_build_50
VST3SDK_TAG=v3.7.4_build_25

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout master
git pull
git checkout tags/${TAG}
cd ..

cd vst3sdk
git checkout master
git submodule update --init
git pull --recurse-submodules
git checkout tags/${VST3SDK_TAG}
cd ..

[[ -d ${PKGFOLDER} ]] && rm -rf ${PKGFOLDER}
mkdir -p ${PKGFOLDER}/debian
cp -r debian/* ${PKGFOLDER}/debian/
cp -r src/* ${PKGFOLDER}

cd ${PKGFOLDER}
mkdir -p VST_SDK
cp -pr ../vst3sdk VST_SDK/VST3_SDK
cp -pr ../VST_SDK_2.4 VST_SDK/VST2_SDK
cp -pr ../minimp3 minimp3

cat >> minimp3/Makefile << EOF

minimp3.a : \$(OJBS)
	gcc \$(CFLAGS) \$(OBJS) -o \$@ -shared
EOF

echo y | debuild -b -us -uc -j`nproc`
