#!/bin/bash  
#====================================================
#
#          FILE: Optimize-PNG.sh
# 
#         USAGE: ./Optimize-PNG.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/14/2018 13:26
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	for f in .
	do 
		pngquant --skip-if-larger --output ./Output --quality 30-60 --strip --verbose "$f"
	done
}	# end Main

Main

#===EXIT===
exit 0

