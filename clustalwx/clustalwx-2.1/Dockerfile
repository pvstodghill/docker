# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE clustalwx
ENV VERSION 2.1

## Build clustalw from source
ADD clustalw-${VERSION}.tar.gz /tmp/
WORKDIR /tmp/clustalw-${VERSION}
RUN \
    ./configure --prefix=/opt/clustalw && \
    make && \
    mkdir -p /opt/clustalw && \
    cp --archive src/clustalw2 /opt/clustalw && \
    cp --archive clustalw_help /opt/clustalw
WORKDIR /root
RUN rm -rf /tmp/clustalw-${VERSION}

## Build clustalx from source
RUN apt-get install --yes qt4-default
ADD clustalx-${VERSION}.tar.gz clustalx.bash /tmp/
WORKDIR /tmp/clustalx-${VERSION}
RUN \
    qmake && \
    make && \
    mkdir -p /opt/clustalx && \
    cp --archive colprot.xml coldna.xml colprint.xml clustalx.hlp clustalx /opt/clustalx && \
    mv /opt/clustalx/clustalx /opt/clustalx/clustalx.bin && \
    mv /tmp/clustalx.bash /opt/clustalx/clustalx
WORKDIR /root
RUN rm -rf /tmp/clustalx-${VERSION}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/clustalw:/opt/clustalx:${PATH}
# needed for clustalx to work
ENV QT_X11_NO_MITSHM=1
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/* -type f | sort
