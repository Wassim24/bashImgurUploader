#!/bin/bash
# https://github.com/Ceryn/img
# Call with '-s' to target only a selection of the screen.

clientid='2b6e769e9c70b62'

res=$(curl --header "Authorization: Client-ID $clientid" -F "image=@$1" https://api.imgur.com/3/upload)
 
link=$(echo $res | sed -e 's/.*"link":"\([^"]*\).*/\1/' -e 's/\\//g')
echo "$link" | xclip -selection clipboard
paplay /usr/share/sounds/freedesktop/stereo/complete.oga