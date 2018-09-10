#!/bin/bash  
#=========================================================
#
#          FILE: funcOS.sh
# 
#         USAGE: ./funcOS.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/24/2018 00:45
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error


DELIMITER="#########################################################"
function funcOS ()
{
local OS

if [ -f /etc/os-release ]; then
    	# freedesktop.org and systemd    
	. /etc/os-release    
	OS=$NAME    
elif type lsb_release >/dev/null 2>&1; then    
	# linuxbase.org    
	OS=$(lsb_release -si)    
elif [ -f /etc/lsb-release ]; then    
	# For some versions of Debian/Ubuntu without lsb_release command    
	. /etc/lsb-release    
	OS=$DISTRIB_ID    
elif [ -f /etc/debian_version ]; then    
	# Older Debian/Ubuntu/etc.    
	OS='Debian'    
elif [ -f /etc/SuSe-release ]; then    
	# Older SuSE/etc.   
        OS='SuSe'	
else    OS='Other'

fi

echo $OS
}
