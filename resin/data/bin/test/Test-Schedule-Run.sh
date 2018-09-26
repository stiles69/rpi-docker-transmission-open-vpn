#!/bin/bash  
#===============================================================================
#
#          FILE: Test-Schedule-Run.sh
# 
#         USAGE: ./Test-Schedule-Run.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 03/07/18 08:14
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

source $HOME/lib/sh/sys.scheduled_run

sys.scheduled_run ~/bin/Update-Gentoo-PI64.sh 1
