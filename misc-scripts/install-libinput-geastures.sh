#!/bin/bash
echo "First make sure you have installed the following packages: xdotool wmctrl"
echo -n "Are these packages installed, Y/n: "
read QUESTION
if [ $QUESTION != "Y" ]; then
  echo "Install packages first"
  exit 1
fi

cd ../submodules/libinput-gestures
sudo ./libinput-gestures-setup install
sudo gpasswd -a $USER input

echo "Now logoff and logon again so your user is in the input group"
