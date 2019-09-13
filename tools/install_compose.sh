#!/usr/bin/env bash

set -e

apt-get update && apt-get install -y \
    python3-dev \
    python3-pip \
    libffi-dev \
    libssl-dev

pip3 install setuptools docker-compose
