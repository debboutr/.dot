#! /home/rick/.venv/bin/python3

"""
ffmpeg -i DJI_0007.MP4 -c:v h264_nvenc -rc:v vbr -b:v 10M -vf "scale=1920:1080" -r 30 -c:a aac -b:a 128k -movflags +faststart fromffmpeg.mp4
"""

import os
import sys

fn = "clean.sh"
text = 'ffmpeg -i {} -c:v h264_nvenc -rc:v vbr -b:v 10M -vf "scale=1920:1080" -r 30 -c:a aac -b:a 128k -movflags +faststart {}\n'
print(os.getcwd())
vids = [f for f in os.listdir() if f.startswith('DJI_')]
if vids:
    os.mkdir("orig")
with open(fn, "w") as f:
    f.write('#!/bin/sh\n')
    for v in vids:
        n = v.replace("DJI", "CLN")
        print(text.format(v, n))
        f.write(text.format(v, n))
        f.write(f"mv {v} orig\n")

mode = os.stat(fn).st_mode
mode |= 0o111
os.chmod(fn, mode) 
