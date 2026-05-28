#!/bin/bash

DRIVE_ID="1lEeDKULCvMA0j19caD0zRX3tqD3Uj37x"

while true
do
  echo "Downloading New Video from Google Drive..."
  wget --no-check-certificate 'https://docs.google.com/uc?export=download&id='$DRIVE_ID -O video.mp4
  
  echo "Starting New Live Stream to YouTube..."
  ffmpeg -re -i video.mp4 -vcodec libx264 -preset veryfast -b:v 3000k -maxrate 3000k -bufsize 6000k -acodec aac -b:a 128k -f flv rtmp://a.rtmp.youtube.com/live2/$STREAM_SECRET
  
  rm video.mp4
  echo "Restarting stream..."
  sleep 5
done
