# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE pyani
ENV VERSION 0.2.4

RUN apt-get update

# Unpack the binaries to /opt/...
WORKDIR /opt

ADD MUMmer*.tar.gz /opt/
RUN \
    apt-get install --yes tcsh && \
    mv MUMmer* MUMmer && \
    cd MUMmer && \
    make check && \
    make all && \
    :

ADD blast-*.tar.gz /opt/
RUN \
    mv blast-* legacy-blast && \
    :

ADD ncbi-blast-*.tar.gz /opt/
RUN \
    mv ncbi-blast-* blast+ && \
    :

ADD pyani-*.tar.gz /opt/
RUN \
    apt-get install --yes python3-pip tcsh && \
    mv pyani-* pyani && \
    cd pyani && \
    pip3 install -r requirements.txt && \
    python3 setup.py build && \
    :


# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

ENV PATH /opt/MUMmer:${PATH}
ENV PATH /opt/legacy-blast/bin:${PATH}
ENV PATH /opt/blast+/bin:${PATH}
ENV PATH /opt/pyani/bin:${PATH}
ENV PYTHONPATH /opt/pyani:${PYTHONPATH}

# Default command - list the installed files
CMD find /opt/pyani -type f | sort
