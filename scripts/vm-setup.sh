# Copyright 2024 Computer Networks Group @ UPB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/env bash

# Always run in no error conditions, otherwise it is very hard to follow in the log trace what command might have failed
set -e

# Install generic packages and toolchains
sudo apt-get update

KERNEL=$(uname -r)
# DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
sudo apt-get install -y --no-install-recommends \
  autoconf \
  automake \
  bison \
  build-essential \
  ca-certificates \
  cmake \
  cpp \
  curl \
  flex \
  git \
  libboost-dev \
  libboost-filesystem-dev \
  libboost-iostreams-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libboost-test-dev \
  libboost-thread-dev \
  libc6-dev \
  libevent-dev \
  libffi-dev \
  libfl-dev \
  libgc-dev \
  libgc1c2 \
  libgflags-dev \
  libgmp-dev \
  libgmp10 \
  libgmpxx4ldbl \
  libjudy-dev \
  libpcap-dev \
  libreadline-dev \
  libtool \
  libssl-dev \
  linux-headers-$KERNEL\
  make \
  pkg-config \
  python3-dev \
  python3-ipaddr \
  python3-pip \
  python3-psutil \
  python3-scapy \
  python3-setuptools \
  tcpdump \
  unzip \
  vim \
  wget \
  xcscope-el \
  xterm \
  git \
  mininet \
  openvswitch-switch \
  openvswitch-common \
  vlc

# Install Ryu network controller and Mininet packages
sudo pip install ryu
sudo pip install mininet

# Fix a compatability issue with eventlet
sudo pip uninstall --yes eventlet
sudo pip install eventlet==0.30.2

# Install needed Python libraries
pip install networkx
pip install matplotlib

