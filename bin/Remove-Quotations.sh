#!/bin/zsh  
#===============================================================================
#
#          FILE: Remove-Quotations.sh
# 
#         USAGE: ./Remove-Quotations.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/08/2018 02:59
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
function Main ()
{
	# Load zmv command
	autoload zmv
	# Remove '
	zmv '(*)' "\${1//\\'/}"
	# Remove spaces
	zmv '(*)' "\${1//\\'/}"         
}	# end Main

Main # Call Main

# == Exit ==
exit 0	# Always exit properly


