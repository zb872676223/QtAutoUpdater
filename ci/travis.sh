#!/bin/bash
set -ex

currDir=$(dirname $0)

# add packagekit-qt
if [[ $PLATFORM == "gcc_64" ]]; then
	# prepend pre build script
	mv qtmodules-travis/ci/linux/build-docker.sh qtmodules-travis/ci/linux/build-docker.sh.orig
	mv "$currDir/travis_pkgkit.sh" qtmodules-travis/ci/linux/build-docker.sh
	cat "$currDir/travis_qthttpserver.sh" >> qtmodules-travis/ci/linux/build-docker.sh
	cat qtmodules-travis/ci/linux/build-docker.sh.orig >> qtmodules-travis/ci/linux/build-docker.sh
elif [[ $PLATFORM == "clang_64" ]]; then
	SUDO=sudo "$currDir/travis_qthttpserver.sh"
fi
