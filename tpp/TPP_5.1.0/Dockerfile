# -*- default-generic -*-

# Not very helpful:
# http://tools.proteomecenter.org/wiki/index.php?title=TPP_5.x_development:_Installing_on_Ubuntu_16.04

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV BUILD_PACKAGES build-essential curl libbz2-dev libgd-dev \
    		   libpng12-dev libxalan-c-dev zlib1g-dev
ENV RUN_PACKAGES gnuplot-nox libbz2-1.0 libgd3 libpng12-0 unzip xalan \
    		 xsltproc zlib1g

# Install required packages
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update && \
    apt-get install --yes ${BUILD_PACKAGES} ${RUN_PACKAGES} && \
    : done

# Unpack
ENV PACKAGE TPP
ENV VERSION 5.1.0
ADD ${PACKAGE}_${VERSION}-src.tgz /tmp/
ADD site.mk /tmp/${PACKAGE}_${VERSION}-src/
WORKDIR /tmp/${PACKAGE}_${VERSION}-src

# Build
RUN \
    curl -q -L http://cpanmin.us | perl - App::cpanminus && \
    cpanm Bundle::CPAN && \
    cpanm CGI && \
    cpanm XML::Parser && \
    cpanm FindBin::libs && \
    make libgd && \
    make all && \
    make install && \
    : done

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE}-${VERSION} && \
   apt-get remove --yes --purge ${BUILD_PACKAGES} && \
   apt-get autoremove -y && \
   apt-get clean && \
   : done

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
