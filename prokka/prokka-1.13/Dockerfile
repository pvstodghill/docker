# -*- default-generic -*-

# https://github.com/tseemann/prokka
# Additional:
# - https://github.com/tseemann/barrnap
# - http://www.cbs.dtu.dk/cgi-bin/sw_request?signalp

FROM ubuntu:artful
#FROM ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV GITUSER tseemann
ENV PACKAGE prokka
ENV VERSION 1.13
ENV BUILD_PACKAGES git build-essential
ENV RUN_PACKAGES libdatetime-perl libxml-simple-perl \
    default-jre-headless bioperl ncbi-tools-bin \
    libtime-piece-perl less cd-hit

# Install required packages
RUN \
    sed -i'' 's/archive\.ubuntu\.com/mirrors.rit.edu/' /etc/apt/sources.list && \
    sed -i'' 's/security\.ubuntu\.com/mirrors.rit.edu/' /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

ADD prokka-1.13.tar.gz /opt/
RUN mv /opt/prokka-1.13 /opt/prokka
ADD barrnap-0.8.tar.gz /opt/
RUN mv /opt/barrnap-0.8 /opt/barrnap
ADD signalp-4.1f.Linux.tar.gz signalp-4.1f.patch /opt/
RUN cd /opt/ ; patch -p0 < signalp-4.1f.patch ; mv signalp-4.1 signalp

WORKDIR /opt/

# Fix for problem with Time::Piece -
# https://github.com/tseemann/prokka/issues/291

RUN \
    useradd -d /mnt -M guest ; \
    cd /opt/prokka ; \
    rm -rf perl5 ; mkdir perl5 ; \
    ./bin/prokka --setupdb ; \
    chown -R guest:guest db ; \
    : done

# Remove the build environment
WORKDIR /root
RUN apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
USER guest
ENV PATH /opt/prokka/bin:/opt/barrnap/bin:/opt/signalp:${PATH}
ENV SIGNALP /opt/signalp
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/prokka -type f | sort
