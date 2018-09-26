#!/bin/bash
#===============================================================================
#
#          FILE:  List-Installed-Packages-Debian.sh
# 
#         USAGE:  ./List-Installed-Packages-Debian.sh 
# 
#   DESCRIPTION:  This will produce a
#		  Package-List.txt file.
# 
#       OPTIONS:  
#  REQUIREMENTS:  dpkg
#          BUGS:  ---
#         NOTES:  You can easily reinstall
#		  after installing base system.
#		  aptitude install $(cat /backup/Package-List.txt | awk '{print $1}')
#
#        AUTHOR:  Brett Salemink
#		  (brett.salemink@gmail.com)
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  13/02/18 01:02:19 CST
#      REVISION:  
#===============================================================================

sudo apt-get install dpkg -y

sudo dpkg --get-selections >/Backups/package-selections



#apt-cache pkgnames >> Package-List.txt
