# -*- default-generic -*-

# https://github.com/tseemann/prokka
# Additional:
# - https://github.com/tseemann/barrnap
# - http://www.cbs.dtu.dk/cgi-bin/sw_request?signalp

FROM ubuntu:artful

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV GITUSER tseemann
ENV PACKAGE prokka
ENV VERSION 12547ca
ENV BUILD_PACKAGES git build-essential
ENV RUN_PACKAGES libdatetime-perl libxml-simple-perl \
    default-jre-headless bioperl ncbi-tools-bin less

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

ADD signalp-4.1f.Linux.tar.gz signalp-4.1f.patch /opt/

RUN \
    useradd -d /mnt -M guest ; \
    cd /opt ; \
    git clone https://github.com/tseemann/prokka.git ; \
    cd /opt/prokka ; \
    git checkout 12547ca ; \
    ./bin/prokka --setupdb ; \
    chown -R guest:guest db ; \
    cd /opt ; \
    git clone https://github.com/tseemann/barrnap.git ; \
    cd /opt/barrnap ; \
    git checkout b00248d ; \
    cd /opt ; \
    patch -p0 < signalp-4.1f.patch ; \
    mv signalp-4.1 signalp ; \
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
