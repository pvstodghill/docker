# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE mummer
ENV VERSION 3.23
ENV BUILD_PACKAGES build-essential 
ENV RUN_PACKAGES gnuplot xfig transfig tcsh libsys-hostname-long-perl

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}


# Unpack and build
ADD MUMmer${VERSION}.tar.gz /tmp/
WORKDIR /tmp/MUMmer${VERSION}

RUN make check \
    && make \
    && cp --archive \
    		dnadiff \
    		nucmer2xfig \
    		run-mummer3 \
    		run-mummer1 \
    		promer \
    		nucmer \
    		mummerplot \
    		mapview \
    		exact-tandems \
    		show-diff \
    		show-snps \
    		show-tiling \
    		show-coords \
    		show-aligns \
    		repeat-match \
    		aux_bin/* \
    		mgaps \
    		gaps \
    		delta-filter \
    		combineMUMs \
    		annotate \
    		mummer \
    	/usr/local/bin/ \
    && mkdir -p /usr/local/share/doc/ \
    && cp --archive docs /usr/local/share/doc/mummer/

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
