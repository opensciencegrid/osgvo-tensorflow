FROM opensciencegrid/osgvo-ubuntu-18.04:latest

LABEL opensciencegrid.name="TensorFlow"
LABEL opensciencegrid.description="TensorFlow image (CPU only)"
LABEL opensciencegrid.url="https://www.tensorflow.org/"
LABEL opensciencegrid.category="Tools"
LABEL opensciencegrid.definition_url="https://github.com/opensciencegrid/osgvo-tensorflow"

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt-get update && apt-get install -y --no-install-recommends \
        gnupg \
        libfreetype6-dev \
        libpng-dev \
        libssl-dev \
        libzmq3-dev \
        && \
    apt-get clean

# bazel is required for some TensorFlow projects
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" >/etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add -

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated \
        bazel

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
RUN python3 -m pip install --upgrade tensorflow==2.3 keras

# stashcp
RUN python3 -m pip install stashcp

COPY labels.json /.singularity.d/

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

