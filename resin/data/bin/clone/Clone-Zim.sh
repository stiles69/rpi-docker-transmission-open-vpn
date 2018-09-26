#!/bin/bash  
#===============================================================================
#
#          FILE: Clone-Notes.sh
# 
#         USAGE: ./Clone-Notes.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/24/2018 10:00
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ ! -d /home/brettsalemink/stiles69/ ] 
then
	mkdir ~/stiles69
	echo 'Stiles69 does not exist. Creating it.'
	git clone git@github.com:stiles69/zim.git ~/stiles69/zim
else
	git clone git@github.com:stiles69/zim.git ~/stiles69/zim
fi

exit 0

