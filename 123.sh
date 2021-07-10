#!/bin/bash

# rm input_metadata.txt
# ffmpeg -i input.mp4 -c copy -map_metadata 0 -map_metadata:s:v 0:s:v -map_metadata:s:a 0:s:a -f ffmetadata input_metadata.txt

# rm gorin.mp4
# ffmpeg -i $gorin_source -f ffmetadata -i input_metadata.txt -c copy -map_metadata 1 gorin.mp4


# ffmpeg -i input.mp4 &> out.txt
# echo "" >> out.txt
# echo "============================" >> out.txt
# echo "" >> out.txt
# ffmpeg -i gorin_source.mp4 &>> out.txt

# exit

# mediainfo input.mp4 | grep "Encoding settings" | cut -d':' -f2- | tr '/' '\n' | sed 's/ //' > input_mediainfo.txt
# mediainfo gorin.mp4 > gorin_mediainfo.txt
# mediainfo input.mp4 > input_mediainfo.txt
# mediainfo gorin51.mp4 > gorin51_mediainfo.txt
# mediainfo output.mp4 > output_mediainfo.txt
# mediainfo input.mp4

# ffmpeg -i gorin_source.mp4 -c:a copy gorin.mp4

# ffmpeg -i gorin.mp4 -c:v libx264 -profile:v high -level:v 5.1 -c:a copy gorin51.mp4



# ffmpeg -i gorin.mp4 \
#   -c:v libx264 \
#     -profile:v high \
#     -level:v 5.1 \
#     -x264-params \
#       keyint=666:min-keyint=42 \
#   -c:a copy \
#   output.mp4


# mediainfo input.mp4 > input_minfo.txt
# grep -G "ID" input_minfo.txt

# grep "Encoding settings" < input_minfo.txt | cut -d':' -f2- | tr '/' '\n' | sed 's/ //'


# mediainfo input.mp4 | grep "Encoding settings" | cut -d':' -f2- | tr '/' '\n' | sed 's/ //'


from=input.mp4
to=gorin.mp4
out=output.mp4

# # https://superuser.com/questions/996223/using-ffmpeg-to-copy-metadata-from-one-file-to-another
# ffmpeg -i $from -i $to -map 1 -c copy \
#   -map_metadata 0 \
#   -map_metadata:s:v 0:s:v \
#   -map_metadata:s:a 0:s:a \
#   $out

# ffprobe -v error -show_entries format=size -of default=noprint_wrappers=1:nokey=1 input.mp4

ffprobe -v error -show_entries stream=profile -of default=noprint_wrappers=1:nokey=1 input.mp4

  # ffprobe -v error -show_format -show_streams input.mp4

# mediainfo input.mp4 > input_mediainfo.txt
# mediainfo gorin.mp4 > gorin_mediainfo.txt
# mediainfo output.mp4 > output_mediainfo.txt
