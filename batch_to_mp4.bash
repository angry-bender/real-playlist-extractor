#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'


source='/media/ubuntu/hdd/Rec/BDAV/STREAM'
target='/media/ubuntu/hdd/Rec/mp4'

#Will do the first 50 files

for n in {00000..50}; do
        file="${source}/${n}.m2ts"
        if test -f "$file"; then
                name=${file##*/}
                base=${name%.m2?s}
                echo -e "${GREEN} ffmpeg -i $file -vcodec libx265 -preset veryfast -crf 24 -acodec ac3 -vf "yadif" $target/$base.mp4 ${NC}"
                ffmpeg -i $file -vcodec libx265 -preset veryfast -crf 24 -acodec ac3 -vf "yadif" $target/$base.mp4
                #optional  RM (if space is an issue on your drive
                # rm $file
        fi
done

