FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE breseq
ENV VERSION 0.28.1

ENV BUILD_PACKAGES \
	automake \
	build-essential \
	libncurses5-dev \
	libtool \
	zlib1g-dev

ENV RUN_PACKAGES ""

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}


# Unpack and build
WORKDIR /tmp
ADD ${PACKAGE}-${VERSION}.tar.gz .
WORKDIR /tmp/${PACKAGE}-${VERSION}
RUN \
	./bootstrap.sh \
	&& ./configure --prefix=/usr/local \
	&& make \
	&& make install

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
