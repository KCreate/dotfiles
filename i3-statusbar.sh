#!/bin/bash
i3status | while :
do
    read line
    spotify=$(~/dotfiles/.i3-spotify.sh)
    echo "$spotify | $line" || exit 1
done
