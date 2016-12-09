FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE ea-utils
ENV xPACKAGE ExpressionAnalysis-ea-utils
ENV VERSION 27a4809
ENV BUILD_PACKAGES build-essential libgsl0-dev zlib1g-dev
ENV RUN_PACKAGES ""

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}


# Unpack and build
WORKDIR /tmp
ADD ${xPACKAGE}-${VERSION}.tar.gz .
WORKDIR /tmp/${xPACKAGE}-${VERSION}/clipper
RUN make && make PREFIX=/usr/local install

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${xPACKAGE}-${VERSION} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
