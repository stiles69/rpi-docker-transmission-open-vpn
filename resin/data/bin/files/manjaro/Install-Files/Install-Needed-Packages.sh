#!/bin/bash  
#=====================================================
#
#          FILE: Install-Needed-Native-Packages.sh
# 
#         USAGE: ./Install-Needed-Native-Packages.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/06/2018 18:41
#      REVISION:  ---
#=====================================================
set -o nounset                              # Treat unset variables as an error
set e
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
AURPACKAGELIST="$HOME/bin/files/manjaro/Aur-Package-List.txt"
NATIVEPACKAGELIST="$HOME/bin/files/manjaro/Native-Package-List.txt"
NOTINSTALLEDNATIVEPACKAGELIST="$HOME/bin/files/manjaro-Not-Installed-Native-Package-List.txt"
NOTINSTALLEDAURPACKAGELIST="$HOME/bin/files/manjaro-Not-Installed-Aur-Package-List.txt"
#-------------------------------------
function Proceed ()
{
	echo "This will install the Native and Aur saved packages lists."
	echo $(cat $HOME/bin/files/manjaro/Aur-Package-List.txt)
	echo "Do you want to continue? [Y/n]"
	read PROCEED
	case $PROCEED in
		"Y"|"y")
		ReadArrayNative
		ReadArrayAur
		wait
		;;
		"N"|"n")
		exit 0
		;;
		*)
		echo "Unexpected response, exiting.."
		exit 0
		;;
	esac
}	# end function

function ReadArrayNative ()
{
	counter=0
	readarray native < "$NATIVEPACKAGELIST"
	cat "$NATIVEPACKAGELIST" | while read myline; 
	do
    		counter=$(($counter+1))
	done
}	# end Main

function ReadArrayAur ()
{
	counter=0
	readarray aur < "$AURPACKAGELIST"
	cat "$AURPACKAGELIST" | while read myline 
	do
    		counter=$(($counter+1))
	done
}	# end Main

function InstallNative ()
{
	tLen=${#native[@]}
	# use for loop read all nameservers
	for (( i=0; i<${tLen}; i++ ));
	do
  		echo "Do you want to install ${native[$i]}? [Y/n]"
		read INSTALLNATIVE
		case "$INSTALLNATIVE" in
			Y|y)
			yaourt -S --needed --noconfirm ${native[$i]}
			wait
			;;
			N|n)
			echo ${native[$i]} >> $NOTINSTALLEDNATIVEPACKAGELIST
			;;
			*)
			echo "Unexpected input, skipping package ${native[$i]}."
			echo ${native[$i]} >> $NOTINSTALLEDNATIVEPACKAGELIST
			;;
		esac
#		yaourt -S --needed --confirm ${native[$i]}
#		wait
	done	
}	# end function

function InstallAur ()
{
	tLen=${#aur[@]}
	# use for loop read all nameservers
	for (( i=0; i<${tLen}; i++ ));
	do
  		echo "Do you want to install ${aur[$i]}? [Y/n]"
		read INSTALLAUR
		case $INSTALLAUR in
			Y|y)
			yaourt -S --needed --noconfirm ${aur[$i]}
			wait
			;;
			N|n)
			echo ${aur[$i]} >> $NOTINSTALLEDAURPACKAGELIST
			wait
			;;
			*)
			echo "Unexpected input, skipping package ${aur[i]}."
			echo ${aur[$i]} >> $NOTINSTALLEDAURPACKAGELIST
			;;
		esac
	done	
}	# end function

function Main ()
{
	Proceed
	InstallNative
	InstallAur
}	# end Main

Main

#===EXIT===
exit 0
