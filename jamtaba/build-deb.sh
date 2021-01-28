#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=jamtaba
VERSION=2.1.16
TAG=v2.1.16

VST3SDK_TAG=v3.7.1_build_50

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout tags/${TAG}
cd ..

cd vst3sdk
git checkout tags/${VST3SDK_TAG}
cd ..

cp -r VST_SDK_2.4/* vst3sdk/

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}
mkdir -p VST_SDK
cd VST_SDK
ln -sfn ../../vst3sdk VST3_SDK
ln -sfn ../../VST_SDK_2.4 VST2_SDK
cd ..
ln -sfn ../minimp3 minimp3

echo y | debuild -b -us -uc -j`nproc`
