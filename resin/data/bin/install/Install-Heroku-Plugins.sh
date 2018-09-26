#!/bin/bash  
#===============================================================================
#
#          FILE: Install-Heroku-Plugins.sh
# 
#         USAGE: ./Install-Heroku-Plugins.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/06/2018 01:44
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function ProceedHerokuBuilds ()
{
	echo "Do you want to install Heroku Plugin Heroku-Builds?[Y/n]"
	read PROCEEDHEROKUBUILDS
	case $PROCEEDHEROKUBUILDS in
		"Y"|"y")
		heroku plugins:install heroku-builds
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		heroku plugins:install heroku-builds
		;;
	esac
}	# end function

function ProceedHerokuRepo ()
{
	echo "Do you want to install Heroku Plugin Heroku-Repo?[Y/n]"
	read PROCEEDHEROKUREPO
	case $PROCEEDHEROKUREPO in
		"Y"|"y")
		heroku plugins:install heroku-repo
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		heroku plugins:install heroku-repo
		;;
	esac

}	# end function

function ProceedHerokuApi ()
{
	echo "Do you want to install Heroku Plugin Heroku-Api?[Y/n]"
	read PROCEEDHEROKUAPI
	case $PROCEEDHEROKUAPI in
		"Y"|"y")
		heroku plugins:install api
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		heroku plugins:install api
		;;
	esac

}	# end function


function ProceedHerokuSlugs ()
{
	echo "Do you want to install Heroku Plugin Heroku-Slugs?[Y/n]"
	read PROCEEDHEROKUSLUGS
	case $PROCEEDHEROKUSLUGS in
		"Y"|"y")
		heroku plugins:install heroku-slugs
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		heroku plugins:install heroku-slugs
		;;
	esac

}	# end function


function ProceedHerokuKafka ()
{
	echo "Do you want to install Heroku Plugin Heroku-Kafka?[Y/n]"
	read PROCEEDHEROKUKAFKA
	case $PROCEEDHEROKUKAFKA in
		"Y"|"y")
		heroku plugins:install heroku-kafka
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		heroku plugins:install heroku-kafka
		;;
	esac

}	# end function

function ProceedNo ()
{
	echo "Not installing."
}	# end function

function Main ()
{
	ProceedHerokuBuilds
	ProceedHerokuRepo
	ProceedHerokuApi
	ProceedHerokuSlugs
	ProceedHerokuKafka
}	# end Main

Main # Call Main

# == Exit ==
exit 0	# Always exit properly


