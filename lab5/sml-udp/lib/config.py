"""
 Copyright 2024 Computer Networks Group @ UPB

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 """

import os, sys

# get rid of grpc fork-support warnings
os.environ["GRPC_POLL_STRATEGY"] = "poll"

# setup env
libdir = os.path.join(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(libdir, "p4app/src"))
os.environ["APP_ROOT"] = os.path.abspath(os.path.join(libdir, "../"))
os.environ["APP_LOGS"] = os.path.join(os.environ["APP_ROOT"], "logs")
os.environ["APP_TEST"] = os.path.join(os.environ["APP_LOGS"], "test")

# create the logs dir if not there
if not os.path.exists(os.environ["APP_LOGS"]):
    os.makedirs(os.environ["APP_LOGS"])