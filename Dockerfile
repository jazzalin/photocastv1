FROM nvidia/cuda:12.6.2-base-ubuntu20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install application dependencies
RUN apt-get update && \
    apt-get install -y \
    python3.9 \
    python3-pip \
    python3-dev

# Install any python packages you need
COPY requirements.txt requirements.txt

RUN python3 -m pip install -r requirements.txt

# Upgrade pip
RUN python3 -m pip install --upgrade pip

WORKDIR /home/photocast

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]