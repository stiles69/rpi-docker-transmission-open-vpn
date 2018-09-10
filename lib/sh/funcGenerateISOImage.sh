#!/bin/bash  
#===============================================================================
#
#          FILE: 4-Make-DVD.sh
# 
#         USAGE: ./4-Make-DVD.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/15/2018 18:56
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
function GenerateISOImage ()
{
	USAGE="The function GenerateISOImage needs three parameters, MYDVDNAME, DVDISOIMAGE, and THEDIRECTORY. [GenerateISOImage MYDVDNAME DVDISOIMAGENAME THEDIRECTORY]"
	if [ "$#" -lt 2 ]
	then
		echo $USAGE
	else
		MYDVDNAME="$1"
		DVDISOIMAGENAME="$2"

		genisoimage -dvd-video -V "MYDVDNAME" -o "$DVDISOIMAGENAME.iso" "OUTPUTDIR/"
	fi
}	# end GenerateISOImage

