#!/bin/bash

####################################################
#
# Has Googlebot Visited You Yesterday?
#
# Email Results - Editing in here will break stuff :)
#
####################################################

####################################################
#
#  This is a very inefficient script but that is by design.
#  I want all the data from each command to be stored
#  in text files for you to look at so you can understand
#  what happens.
#
# Once you have this working, why don't you try to improve it? :)
#
#  This Script is part of the technical SEO training from 
#  https://the.domain.name
#  and copyright is reserved and owned by ForeverUn Limited.
#
#  This script is licensed under the Creative Commons
#  Attribution-ShareAlike 4.0 International
#
#  https://creativecommons.org/licenses/by-sa/4.0/
#
#  Link: Googlebot Analysis Shell Script - https://the.domain.name/
#
####################################################

source variables.sh

curl -s --user $mailgunapi \
    $mailgunapiurl \
    -F from=$mailgunfrom \
    -F to=$email \
    -F subject=$yesterday GBot Visits \
    -F text=$text\
    -F attachment=@$yesterdaygbotlog \
    -F attachment=@$yesterdaygbot



exit
