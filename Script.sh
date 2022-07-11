#!/bin/bash

# This script will collect the contributers names and return a list of all the contributers tha contribute to that project in GitHub

path=$(pwd)
#while read line ; do echo ${line##*/} ; done < GitHub_links.txt
collect_logs(){
	while read line
	do
		# get the directory of the github repository
		link="${line##*/}"
		echo "${link%.*}"
		#git clone $line
		#cd "$path/
	done < GitHub_links.txt

}

collect_logs
