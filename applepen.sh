#!/bin/bash

filename=$1
filename=${filename//\\//}
basename="${filename##*/}"
gorin_source=gorin_source.mp4

filename=input.mp4

echo $filename
echo $basename
read -p "Press [Enter] to continue..."

durationsecs=`ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $filename`
durationsecs=${durationsecs%.*}
durationsecs=$((durationsecs + 1))
durationsecs_start=$(((durationsecs / 2) + $RANDOM % (durationsecs / 4)))
durationsecs_end=$((durationsecs-durationsecs_start))
resolution=`ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 $filename`

rm gorin.mp4
ffmpeg -i $gorin_source -s $resolution -c:a copy gorin.mp4

rm part1.mp4
ffmpeg -ss 0 -i $filename -t $durationsecs_start -c copy part1.mp4

rm part2.mp4
ffmpeg -ss $durationsecs_start -i $filename -t $durationsecs_end -c copy part2.mp4

rm output.mp4
ffmpeg -f concat -safe 0 -i list.txt -c copy output.mp4
