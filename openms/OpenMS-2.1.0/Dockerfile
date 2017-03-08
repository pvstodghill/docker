# -*- default-generic -*-

FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE openms
ENV VERSION 2.1.0
ENV BUILD_PACKAGES build-essential autoconf libtool cmake \
    libsvm-dev libglpk-dev \
    libqt4-dev libqt4-opengl-dev libqtwebkit-dev
ENV RUN_PACKAGES libqtcore4 libqtgui4 libqt4-network \
    libqt4-opengl libqt4-svg libqtwebkit4 libgomp1

# libxerces-c-dev  libeigen3-dev

# Install required packages
RUN apt-get update ; \
    echo ${RUN_PACKAGES} ${BUILD_PACKAGES} \
    	 | xargs -n1 apt-get install --yes
## weird installation method because something funny happens with
## "shared-mime-info"


# Unpack and build
ADD OpenMS-Release${VERSION}.tar.gz contrib-Release${VERSION}.tar.gz /tmp/
WORKDIR /tmp/OpenMS-Release${VERSION}

RUN \
    mv ../contrib-Release${VERSION} contrib ; \
    mkdir contrib-build ; \
    cd contrib-build ; \
    cmake -DBUILD_TYPE=ALL ../contrib ; \
    cd .. ; \
    mkdir build ; \
    cd build ; \
    cmake \
        -DCMAKE_PREFIX_PATH="/tmp/OpenMS-Release${VERSION}/contrib-build;/usr;/usr/local" \
	-DCMAKE_INSTALL_PREFIX=/usr/local \
	.. ; \
    make -j`nproc` ; \
    make  install

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE}-${VERSION} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
