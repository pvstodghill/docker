# -*- default-generic -*-

FROM centos:6

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE TPP
ENV VERSION 5.0.0

# Install required packages
RUN yum -y update && yum clean all
ENV BUILD_PACKAGES gcc gcc-c++ subversion bzip2-devel zlib-devel zlib-static \
    patch unzip gd-devel wget glibc-static libpng-devel libpng-static
ENV RUN_PACKAGES perl perl-CPAN perl-devel perl-XML-Parser perl-CGI \
    perl-ExtUtils-MakeMaker
RUN yum -y install ${BUILD_PACKAGES} ${RUN_PACKAGES} && yum clean all
RUN curl -q -L http://cpanmin.us | perl - App::cpanminus ; cpanm FindBin::libs

# Unpack and build
ADD ${PACKAGE}_${VERSION}-src.tgz /tmp/
ADD site.mk pwiz1.patch pwiz2.patch /tmp/${PACKAGE}_${VERSION}-src/
WORKDIR /tmp/${PACKAGE}_${VERSION}-src

# FIXME
RUN patch -p0 < pwiz1.patch
RUN mkdir -p extern/ProteoWizard/pwiz-msi
RUN make pwiz-msi
RUN patch -p0 < pwiz2.patch
RUN make all
RUN cd extern ; make libpng ; cd ..
RUN make install

# Remove the build environment
WORKDIR /tmp
RUN rm -rf ${PACKAGE}_${VERSION}-src && \
    yum erase -y ${BUILD_PACKAGES} && \
    yum clean all

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
