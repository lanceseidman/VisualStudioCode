#!/bin/bash
# SETUP SCRIPT FOR MS VISUAL STUDIO CORE FOR LINUX
# - SCRIPTED BY LANCE SEIDMAN @LANCESEIDMAN

# check to see if wget exists/any required items
if ! [ -x "$(command -v wget)" ]; then
 echo "Must have wget! Do you want me to install it?"
 echo "1). For Debian/Ubuntu..."
 echo "2). For Fedora..."
 echo "Which # (OS) do you wish to install for: "
 read oswget

if [ $oswget = "" ]; then
	echo "Goodbye!";
	exit
fi

 case $oswget in
 "1") sudo apt-get install wget -y
 ;; 
 "2") sudo yum -y install wget
 ;; 
 *) echo "Goodbye"
    exit
 ;;

esac
fi

# clear the screen then display intro welcome screen
clear

echo "\n############################################"
echo "#     WELCOME TO MS VISUAL STUDIO CORE     #"
echo "#             Installer/Setup!             #"
echo "#------------------------------------------#"
echo "#   QUESTIONS? LANCE@WEARINGDIGITAL.COM    #"
echo "#------------------------------------------#"
echo "# Without further ado, lets get started... #"
echo "############################################\n"
sleep 1 # slow things down
echo "Fetching and Downloading ZIP File...\n"
# use WGET to grab the file from the server.
wget -O MSVSC.zip http://go.microsoft.com/fwlink/?LinkID=534108
sleep 1 # slow things down

if [ ! -f "MSVSC.zip" ]; then
	echo "Seems the file didn't download? Please re-run this setup file again or check folder permissions."
	sleep 1
	exit
fi
echo "Unzipping file..."
sleep 1
unzip MSVSC.zip #unzip file we downloaded/saved

echo "Creating link/alias..."
alias code='MSVSC/Code' | sudo tee -a ~/.bashrc
sleep 1
echo "You can now run VSC by typing 'code' in a terminal!\n"
sleep 1
echo "Goodbye!\n"
exit
