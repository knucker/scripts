#!/bin/bash
#
# Change brightness
# and
# notify with dunstify
#

function usage(){
        echo "Usage: $0 <increase|decrease>"
        exit 1
}
 
test -n "$1" || usage

CUR=$(xbacklight | cut -d"." -f1)

if [ "$1" == "increase" ]
then
	VALUE="$(expr $CUR + 10)"
elif [ "$1" == "decrease" ]
then
	VALUE="$(expr $CUR - 10)"
else
	echo "Error"
	exit
fi

xbacklight -set $VALUE%

appname="Bklight.sh"
appid=61

dunstify -r $appid -a $appname "Brightness" -h "int:value:$(xbacklight)"
