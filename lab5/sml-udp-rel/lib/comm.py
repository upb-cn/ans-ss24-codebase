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

import socket
import random
import time

def send(soc, data, addr):
    """ Send `data` to `addr` using socket `soc` """
    soc.sendto(data, addr)

def receive(soc, nbytes):
    """ Receive `nbytes` bytes from socket `soc` """
    return soc.recvfrom(nbytes)

def unreliable_send(soc, data, addr, sleep=2, p=0.3):
    """
    Send 'data' to 'addr' using socket 'soc' with probability 'p' to sleep or drop the packet
    if 'sleep' is a positive integer:
        the packet has probability 'p' to be delayed by 'sleep' seconds
    if 'sleep' is 0 or negative:
        the packet has probability 'p' to be dropped
    if probability is 0, nothing happens
    """
    if p and random.random() < p:
        if sleep < 1:
            return
        time.sleep(sleep)
    soc.sendto(data, addr)
    #
    # if random.random() < sleep_probability:
    #     time.sleep(sleep_time)
    # soc.sendto(data, addr)

def unreliable_receive(soc, nbytes, p=0.3):
    """
    Receive `nbytes` bytes from socket `soc` with probability 'p'
    If 'p' is a positive value, a timeout exception is raised with probability 'p',
    regardless of the timeout status of the socket, effectively "dropping" the packet
    """
    res = soc.recvfrom(nbytes)
    if p and random.random() < p:
        raise socket.timeout
    return res