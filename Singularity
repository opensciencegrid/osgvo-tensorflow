bootstrap:docker
From:ubuntu:16.04

%post

# to find pip
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/usr/sbin:/bin:/sbin

apt-get update && apt-get upgrade -y --allow-unauthenticated

export DEBIAN_FRONTEND=noninteractive && \
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
        rsync \
        software-properties-common \
        unzip \
        zip \
        zlib1g-dev \
        openjdk-8-jdk \
        openjdk-8-jre-headless \
        vim \
        wget 

apt-get clean 
rm -rf /var/lib/apt/lists/*

curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

pip --no-cache-dir install \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        Pillow \
        scipy \
        sklearn

python -m ipykernel.kernelspec

# Install TensorFlow
pip install --upgrade tensorflow

# keras
pip install --upgrade keras


#############################
# now do the same for python3

curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

pip3 --no-cache-dir install \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        Pillow \
        scipy \
        sklearn

python3 -m ipykernel.kernelspec

# Install TensorFlow
pip3 install --upgrade tensorflow

# keras
pip3 install --upgrade keras

# build info
echo "Timestamp:" `date --utc` | tee /image-build-info.txt


