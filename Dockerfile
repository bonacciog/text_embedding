ARG UBUNTU_VERSION=18.04
ARG CUDA_VERSION=10.2
ARG IMAGE_DIGEST=218afa9c2002be9c4629406c07ae4daaf72a3d65eb3c5a5614d9d7110840a46e

FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu${UBUNTU_VERSION}@sha256:${IMAGE_DIGEST}


RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    build-essential \
    curl \
    wget \
    gpg

RUN apt update && apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update && apt install python3.7 -y

RUN apt-get install -y python3 python-dev python3-dev \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python-pip python3.7-dev python3-pip

RUN python3.7 -m pip install --upgrade pip
RUN ln -sfn /usr/bin/python3.7 /usr/bin/python3

RUN apt update && apt install git -y
RUN git clone https://github.com/UKPLab/sentence-transformers.git

RUN cd sentence-transformers && pip install -e .

WORKDIR /app
ADD . /app