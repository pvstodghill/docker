# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE art
ENV VERSION mountrainier20160605

ADD artbin${VERSION}linux64tgz.tgz /opt
RUN mv /opt/art_bin_* /opt/${PACKAGE}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/${PACKAGE} -type f | sort
