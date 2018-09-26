#!/bin/bash  
#====================================================
#
#          FILE: Git-Bin-SH.sh
# 
#         USAGE: ./Git-Bin-SH.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/24/2018 06:15
#      REVISION:  ---
#======================================================
set -o nounset                              # Treat unset variables as an error
source $HOME/lib/sh/funcDisplayHostname.sh

HOSTNAME="$(DisplayHostname)"

function ProceedYes ()
{
	# Sync Bin
	$HOME/bin/Pull-Bin.sh

	# Sync Sh
	$HOME/bin/Pull-Sh.sh
}

function SetPermissions ()
{
	$HOME/bin/Set-Permissions-Bin.sh
	$HOME/bin/Set-Permissions-Sh.sh
}	# end function

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0
