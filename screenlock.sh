#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -b backgroud -t {real | fake | none} -n neofetch_command"
   echo -e "\t-b Description of what is parameterA"
   echo -e "\t-t Description of what is parameterB"
   echo -e "\t-n Description of what is parameterC"
   exit 1 # Exit script after printing help
}

while getopts "b:t:n:" opt
do
   case "$opt" in
      b | backgroud) backgroud="$OPTARG" ;;
      t | transparency_type) transparency_type="$OPTARG" ;;
      n | neofetch_command) neofetch_command="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

backgroud=${backgroud:-"#141c21"}
neofetch_command=${neofetch_command:-neofetch}
transparency_type=${transparency_type:-none}

if [ "$transparency_type" = "real" ]; then
    transparency_type="";
elif [ "$transparency_type" = "fake" ]; then
    transparency_type="+tr";
else
    transparency_type="";
fi

# Define image locations
FOLDER=`dirname "$BASH_SOURCE"`
ICON=/tmp/lock.png
TMPBG=/tmp/screen.png

# Makes the neofetch, and scrots it (delay there for proccesing, change it to your pc's speed)
echo "urxvt $transparency_type -bg \"$backgroud\" -e sh -c \"i3-msg floating enable > /dev/zero;${neofetch_command};scrot -o -u /tmp/lock.png;sleep 4 \"&" > /tmp/scort-neofetch.sh

bash /tmp/scort-neofetch.sh &

# takes a screenshot
scrot -o /tmp/screen.png

# blurs it and overlays 
convert $TMPBG -blur 0x10 $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG

# actually locks it
i3lock -u -i $TMPBG
