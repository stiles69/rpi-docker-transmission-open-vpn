#!/bin/bash
#===============================================================================
#
#          FILE:  Install-Package-List-Debian.sh
# 
#         USAGE:  ./Install-Package-List-Debian.sh 
# 
#   DESCRIPTION:  This will install packages from
#		  Package-List.txt.
# 
#       OPTIONS:  
#  REQUIREMENTS: Must have aptitude installed. 
#          BUGS:  
#         NOTES:  ---
#        AUTHOR:  Brett Salemink
#		  (brett.salemink@gmail.com) 
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  13/02/18 01:16:36 CST
#      REVISION:  
#===============================================================================

sudo apt-get install dselect -y

sudo apt-get install dpkg -y

sudo apt-get install aptitude -y

sudo dpkg --set-selections </Backups/package-selections

sudo apt-get dselect-upgrade -y



#sudo aptitude install $(cat package-selections | awk '{print $1}')

#read -p "What is the path for Package-List.txt: " packagepath



#aptitude install $(cat $packagepath/Package-List.txt | awk '{print $1}')
