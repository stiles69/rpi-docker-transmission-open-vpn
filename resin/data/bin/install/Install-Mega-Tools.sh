#!/bin/bash  
#===============================================================================
#
#          FILE: Install-Mega-Cmd.sh
# 
#         USAGE: ./Install-Mega-Cmd.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/24/2018 10:52
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# Include Lib
. ~/lib/sh/funcOS.sh

# Use Function
#funcOS

RESULT=$(funcOS)
echo 'The result is '
echo $RESULT

case $RESULT in
	
	"Debian")  
	echo "Installing For Debian/Based"    
	sudo apt-get install python-sparkpost
	sudo apt-get install megatools
	;;

	"Raspbian GNU/Linux")  
	echo "Installing For Debian/Based"    
	sudo apt-get install python-sparkpost
	sudo apt-get install megatools
	;;

	"Antergos Linux")  
	echo "Installing For Arch/Based"    
	yay -S megatools
	;;
	
	*)
	echo 'No match can not install'
	exit
	;;
esac
# Exit
exit 0 




