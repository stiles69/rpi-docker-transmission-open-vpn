#!/bin/bash  
#===============================================================================
#
#          FILE: funcDisplayHostname.sh
# 
#         USAGE: ./funcDisplayHostname.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/15/2018 08:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
function DisplayHostname ()
{
	echo "$(hostname)"
}	# end DisplayHostname


