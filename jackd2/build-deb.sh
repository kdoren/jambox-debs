#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=jackd2
VERSION=1.9.19
TAG=v1.9.19

PKGFOLDER=${PACKAGE}-${VERSION}

cd src
git checkout develop
git pull
git checkout ${TAG}
cd ..

if [ -d ${PKGFOLDER} ]; then
  rm -rf ${PKGFOLDER}/{android,autooptions,commont,compat,dbus,example-clients,linux,macosx,man,posix,solaris,systemd,tests,tools,waflib,windows}
  rm -f ${PKGFOLDER}/*.in ${PKGFOLDER}/*.rst ${PKGFOLDER}/{.travis.yml,.wafupdaterc,COPYING,README_NETJACK2,svnversion_regenerate.sh,waf,wscript}
  rm -rf ${PKGFOLDER}/debian/{.debhelper,jackd2,libjack-jackd2-0,libjack-jackd2-dev,tmp}
  rm -f ${PKGFOLDER}/debian/{copyright_newhints,files} ${PKGFOLDER}/debian/*.debhelper ${PKGFOLDER}/debian/*.substvars ${PKGFOLDER}/debian/stamp*
fi

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
#tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc -j`nproc`

