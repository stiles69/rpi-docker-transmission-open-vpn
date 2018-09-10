#!/bin/bash
#=========================================================
#
#          FILE: Install-Each-Input-Line-From-Text-File.sh
# 
#         USAGE: ./Install-Each-Input-Line-From-Text-File.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/11/2018 17:53
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
set -e
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
PACKAGELIST="$HOME/bin/files/manjaro/Native-Package-List.txt"
NOTINSTALLEDPACKAGELIST="$HOME/bin/files/manjaro/Not-Installed-Package-List.txt"
#-------------------------------------
function Main ()
{
#	counter=0
	readarray a < "$PACKAGELIST"
#	cat "$PACKAGELIST" | while read myline; 
#	do
#		echo value is: ${a[$counter]}
#		echo "Do you want to install this package? [Y/n]"
#		read INSTALLPACKAGE
#		wait
#		case $INSTALLPACKAGE in
#			Y|y)
#			sudo pacman -S --needed "${a[$counter]}"
#			counter=$(($counter+1))
#			;;
#			N|n)
#			echo "${a[$counter]}" >> "$NOTINSTALLEDPACKAGELIST"
#			counter=$(($counter+1))
#			;;
#			*)
#			echo "Invalid answer. Skipping to next package."
#			echo "${a[$counter]}" >> "$NOTINSTALLEDPACKAGELIST"
#			counter=$(($counter+1))
#			;;
#		esac
#    		counter=$(($counter+1))
#	done
}	# end Main

function Install ()
{
	PACKAGENAME="${a[1]}"
	sudo pacman -S --needed "$PACKAGENAME"
}	# end function

Main
Install
#===EXIT===
exit 0

