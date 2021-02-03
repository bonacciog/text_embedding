FROM python:3.7.4-slim-buster


RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    build-essential \
    curl \
    wget \
    gpg

RUN pip install sentence-transformers

WORKDIR /app
ADD . /app