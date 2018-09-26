#!/bin/bash 
#====================================================
#
#          FILE: Make-Temp-Dir.sh
# 
#         USAGE: ./Make-Temp-Dir.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/15/2018 17:59
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
    export TEMPDIR=$(mktemp -p "${TMPDIR:-.}" -d dir-XXXX) || exit 1
    echo "$TEMPDIR"
}	# end Main

Main

#===EXIT===
exit 0

