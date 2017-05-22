# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE goseq
ENV VERSION 1.28.0
ENV BUILD_PACKAGES libcurl4-gnutls-dev libxml2-dev
ENV RUN_PACKAGES r-base

# Add the R repo
RUN apt-get update && apt-get install --yes software-properties-common apt-transport-https
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

# Install the R packages
ADD setup.R /tmp/
RUN Rscript /tmp/setup.R

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
