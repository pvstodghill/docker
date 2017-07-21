# -*- default-generic -*-

FROM ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE ubuntu
ENV VERSION xenial

RUN \
    cp  /etc/apt/sources.list /etc/apt/sources.list.saved \
    && cat /etc/apt/sources.list.saved \
        | sed 's|http://archive\.|http://us.archive.|' \
	     > /etc/apt/sources.list \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update

# useful commands
RUN apt-get install --yes curl unzip wget xml2 gdebi-core

# build tools
RUN apt-get install --yes autoconf build-essential cmake

# essential development packages
RUN apt-get install --yes zlib1g-dev

# perl
RUN apt-get install --yes cpanminus

# python
RUN apt-get install --yes python python-pip

# version constrol
RUN apt-get install --yes git
RUN apt-get install --yes subversion

# java
RUN apt-get install --yes default-jre


# Add the R repo
RUN apt-get install --yes software-properties-common apt-transport-https
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/' && \
    apt-get update && \
    apt-get install --yes \
	r-base \
	r-base-core \
	r-base-dev \
	r-cran-ggplot2 \
	r-mathlib \
	r-recommended


# RUN apt-get install --yes aptitude
# RUN apt-get install --yes gnuplot
# RUN apt-get install --yes octave

