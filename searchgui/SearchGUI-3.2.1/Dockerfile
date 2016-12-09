# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE SearchGUI
ENV VERSION 3.2.1
ENV BUILD_PACKAGES ""
ENV RUN_PACKAGES default-jre

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

# Unpack and copy to ${DEST_DIR}

ENV DEST_DIR /usr/local
ENV BIN_DIR ${DEST_DIR}/bin
ENV LIB_DIR ${DEST_DIR}/lib/${PACKAGE}
ENV DOC_DIR ${DEST_DIR}/share/doc/${PACKAGE}

ADD ${PACKAGE}-${VERSION}-mac_and_linux.tar.gz \
    SearchGUI.bash XxxCLI.bash /tmp/
WORKDIR /tmp

RUN \
cp SearchGUI.bash ${BIN_DIR}/SearchGUI ; \
cp XxxCLI.bash ${BIN_DIR}/SearchCLI ; \
cp XxxCLI.bash ${BIN_DIR}/IdentificationParametersCLI ; \
cp XxxCLI.bash ${BIN_DIR}/FastaCLI ; \
cp XxxCLI.bash ${BIN_DIR}/PathSettingsCLI ; \
    chmod +x ${BIN_DIR}/* ; \
    mkdir -p ${LIB_DIR} ; \
    cp --archive ${PACKAGE}-${VERSION}/* ${LIB_DIR}/ ; \
    : done

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE}-${VERSION} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest && chown -R guest:guest /usr/local
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
