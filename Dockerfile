FROM ubuntu:16.04

MAINTAINER Mats Rynge <rynge@isi.edu>

RUN apt-get update && apt-get upgrade -y --allow-unauthenticated

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --allow-unauthenticated \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        module-init-tools \
        pkg-config \
        python \
        python-dev \
        python3 \
        rsync \
        software-properties-common \
        unzip \
        zip \
        zlib1g-dev \
        openjdk-8-jdk \
        openjdk-8-jre-headless \
        vim \
        wget \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        Pillow \
        scipy \
        sklearn \
        && \
    python -m ipykernel.kernelspec

# Install TensorFlow
RUN pip install --upgrade tensorflow

# keras
RUN pip install --upgrade keras

#############################
# now do the same for python3

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

RUN pip3 --no-cache-dir install \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        Pillow \
        scipy \
        sklearn \
        && \
    python3 -m ipykernel.kernelspec

# Install TensorFlow 
RUN pip3 install --upgrade tensorflow

# keras
RUN pip3 install --upgrade keras

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

