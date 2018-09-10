#!/bin/bash  
#===============================================================================
#
#          FILE: funcCleanPeriods.sh
# 
#         USAGE: ./funcCleanPeriods.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/11/2018 21:59
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
function CleanPeriodFromFilenames ()
{

for fname in *; do
  name="${fname%\.*}"
  extension="${fname#$name}"
  newname="${name//./_}"
  newfname="$newname""$extension"
  if [ "$fname" != "$newfname" ]; then
    echo mv "$fname" "$newfname"
    mv "$fname" "$newfname"
  fi
done
}	# end function

