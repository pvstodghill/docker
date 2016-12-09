# -*- default-generic -*-

FROM centos:6

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE TPP
ENV VERSION 4.8.0
ENV BUILD_PACKAGES gcc gcc-c++ subversion bzip2-devel zlib-devel patch \
     gd-devel
ENV RUN_PACKAGES perl perl-XML-Parser perl-CGI bzip2 zlib gd

# Install required packages
RUN yum -y update && yum clean all
RUN yum -y install ${BUILD_PACKAGES} ${RUN_PACKAGES} && yum clean all

# Unpack and build
ADD ${PACKAGE}_${VERSION}-src.tgz /tmp/
WORKDIR /tmp/${PACKAGE}-${VERSION}/trans_proteomic_pipeline/src

ENV TPP_ROOT /usr/local/
RUN make && make install

# Remove the build environment
WORKDIR /tmp
RUN rm -rf ${PACKAGE}_${VERSION}-src.tgz ${PACKAGE}-${VERSION} && \
    yum erase -y ${BUILD_PACKAGES} && \
    yum clean all

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
