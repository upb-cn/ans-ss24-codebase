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

# Add repository with P4 packages
# https://build.opensuse.org/project/show/home:p4lang

echo "deb http://download.opensuse.org/repositories/home:/p4lang/xUbuntu_20.04/ /" | sudo tee /etc/apt/sources.list.d/home:p4lang.list
wget -qO - "http://download.opensuse.org/repositories/home:/p4lang/xUbuntu_20.04/Release.key" | sudo apt-key add -

sudo apt-get update -qq

sudo apt-get install -y --no-install-recommends \
  p4lang-p4c \
  p4lang-bmv2 \
  p4lang-pi \
  python-is-python3

sudo pip3 install -U scapy ptf psutil grpcio