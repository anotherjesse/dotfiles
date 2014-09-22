#!/bin/bash

dest=~/Pictures/big

mkdir -p $dest/camera
mkdir -p $dest/desktop

function capture_time() {

if ps aux | grep -v grep | grep ScreenSaverEngine > /dev/null
then
  echo "skipping - screensaver running"
else
  imagesnap $dest/camera/$(date +%y%m%d%H%M%S).jpg
  screencapture -x -tjpg $dest/desktop/$(date +%y%m%d%H%M%S).jpg
fi


}

while true; do
  capture_time
  sleep 30
done
