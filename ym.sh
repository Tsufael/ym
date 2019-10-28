#!/bin/bash

if (( $# < 1 ))
then
echo -e "usage:\n$0 query string"
exit 1;
fi

STR=$(echo $@ | sed s/\ /+/g)

LUCKY=$(curl "https://www.youtube.com/results?search_query=$STR" | grep -o -P "/watch\?v=[^\s\"]{0,30}" | head -n 1)

youtube-dl -x --audio-format mp3 https://www.youtube.com$LUCKY -o ~/Media/music/%\(title\)s.%\(ext\)s
