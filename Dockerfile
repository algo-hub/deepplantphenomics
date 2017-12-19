FROM ubuntu:16.04

LABEL maintainer="Mike Cowgill <mike@algohub.com>"
# Image is based on the official tensorflow image

WORKDIR /

# Pick up the dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        libgtk2.0-0 \
        python \
        python-dev \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        sqlite3 \
        software-properties-common \
        wget \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

# Install conda
RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
RUN bash /tmp/miniconda.sh -b -p /opt/conda
RUN rm /tmp/miniconda.sh

# Set PATH and PYTHONPATH environmental variables for conda
ENV PATH /opt/conda/bin:$PATH
ENV PYTHONPATH /opt/conda/lib/python2.7/site-packages:$PYTHONPATH

# Install OpenCV with conda
RUN conda install --quiet --yes --channel menpo opencv=2.4.11

# Download PlantCV
RUN git clone https://github.com/algo-hub/plantcv.git
WORKDIR /plantcv

# Install PlantCV Python prerequisites
RUN pip install --no-cache-dir -r requirements.txt

RUN pip --no-cache-dir install enum34 tensorflow joblib

# Install PlantCV
RUN python setup.py install
RUN cp ./plantcv-pipeline.py /usr/local/bin
RUN cp ./plantcv-train.py /usr/local/bin

# Download DPP
WORKDIR /
RUN git clone https://github.com/algo-hub/deepplantphenomics.git
WORKDIR /deepplantphenomics
RUN python setup.py install

RUN mkdir -p /data

COPY ./images /data