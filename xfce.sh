#!/bin/bash

#Get the necessary components
sudo apt-get update
sudo apt-get install xfce4 xfce4-goodies xfce4-terminal exo-utils tigervnc-standalone-server tigervnc-common dbus-x11 pavuconrol libexo-1-0 ffmpeg -y
sudo apt-get clean
mkdir -p ~/.vnc

echo '#!/bin/bash
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
XAUTHORITY=$HOME/.Xauthority
export XAUTHORITY                                                         
LANG=en_US.UTF-8
export LANG
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session startxfce4 &' > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

echo " "

echo "Running browser patch"
wget https://raw.githubusercontent.com/tuanpham-dev/termux-ubuntu/master/ubchromiumfix.sh && chmod +x ubchromiumfix.sh
./ubchromiumfix.sh && rm -rf ubchromiumfix.sh

echo "You can now start vncserver by running vncserver-start"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with Xfce4 Desktop Environment"
echo " "
echo " "
echo " "
echo "Running vncserver-start"
echo " "
echo " "
echo " "
echo "To Kill VNC Server just run vncserver-stop"
echo " "
echo " "
echo " "

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd
vncserver-start
