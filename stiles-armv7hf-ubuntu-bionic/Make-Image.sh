#!/bin/bash


#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	docker build -t stiles/armv7hf-ubuntu:bionic .
}	# end Main

Main

#===EXIT===
exit 0
