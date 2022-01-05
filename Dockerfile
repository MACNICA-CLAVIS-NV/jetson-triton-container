ARG BASE_IMAGE=nvcr.io/nvidia/l4t-base:r32.6.1
FROM ${BASE_IMAGE}

ARG RELEASE_FILE_URL="https://github.com/triton-inference-server/server/releases/download/v2.17.0/tritonserver2.17.0-jetpack4.6.tgz"
ARG TRITON_PATH=/triton

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"

WORKDIR /tmp

RUN apt-get update && apt-get install -y ca-certificates
COPY  nvidia-l4t-apt-source.list /etc/apt/sources.list.d/nvidia-l4t-apt-source.list
COPY  jetson-ota-public.asc /etc/apt/trusted.gpg.d/jetson-ota-public.asc
RUN apt-get update

RUN apt-get update && \
    apt-get install -y libopencv-dev && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        autoconf \
        automake \
        build-essential \
        cmake \
        git \
        libb64-dev \
        libre2-dev \
        libssl-dev \
        libtool \
        libboost-dev \
        libcurl4-openssl-dev \
        libopenblas-dev \
        rapidjson-dev \
        patchelf \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN apt-get remove -y cmake && \
    wget https://cmake.org/files/v3.21/cmake-3.21.0.tar.gz && \
    tar -xf cmake-3.21.0.tar.gz && \
    cd cmake-3.21.0 && ./configure && make install

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        pkg-config \
        libjpeg-dev \
        python3 \
        python3-pip \
        python3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade wheel setuptools cython && \
    pip3 install --upgrade grpcio-tools numpy==1.19.4 future attrdict Pillow

RUN mkdir -p ${TRITON_PATH}

WORKDIR ${TRITON_PATH}

RUN wget ${RELEASE_FILE_URL} && \
    tar xvf `basename ${RELEASE_FILE_URL}` && \
    rm -f `basename ${RELEASE_FILE_URL}`

