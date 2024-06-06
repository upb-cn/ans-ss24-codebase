#!/bin/bash

vlc-wrapper './videos/crossroad360.mp4' --sout '#transcode{vcodec=h264,vb=800,acodec=mpga,ab=128,channels=2,samplerate=44100}:rtp{dst=10.0.7.7,port=5004,mux=ts}'
