#!/bin/bash
#===============================================================================
#
#          FILE:  convert.sh
# 
#         USAGE:  ./convert.sh 
# 
#   DESCRIPTION:  This will change files.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  03/23/2018 01:17:28 PM CDT
#      REVISION:  ---
#===============================================================================
for file in *.styl; do echo "/*! FILENAME: $file */" >tempfile; cat $file >>tempfile; mv tempfile $file; done 
