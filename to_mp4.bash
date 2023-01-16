#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'


source='/media/ubuntu/hdd/Rec/BDAV/STREAM'
target='/media/ubuntu/hdd/Rec/mp4'

for file in $source/*.m2ts; do
  name=${file##*/}
  base=${name%.m2?s}
  echo -e "${GREEN} ffmpeg -i $file -vcodec libx265 -preset veryfast -crf 24 -acodec ac3 -vf "yadif" $target/$base.mp4 ${NC}"
  ffmpeg -i $file -vcodec libx265 -preset veryfast -crf 24 -acodec ac3 -vf "yadif" $target/$base.mp4
  #rm $file
done
