#!/bin/bash 
#====================================================
#
#          FILE: Rsync-Current-Dir-To-Manjaro-Adult.sh
# 
#         USAGE: ./Rsync-Current-Dir-To-Manjaro-Adult.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/16/2018 11:46
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
    rsync -rvz --progress ./ brettsalemink@manjaro.roguedesigns.us:/mnt/Media/Adult

    ssh cp.manjaro sudo chown -R plex:brettsalemink /mnt/Media

    ssh cp.manjaro sudo chmod -R 774 /mnt/Media

}	# end Main

Main

#===EXIT===
exit 0

