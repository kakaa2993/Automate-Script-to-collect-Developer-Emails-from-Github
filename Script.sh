#!/bin/bash

# This script will collect the contributers names and return a list of all the contributers tha contribute to that project in GitHub

path=$(pwd)
#while read line ; do echo ${line##*/} ; done < GitHub_links.txt
touch logs.txt
collect_logs(){
	while read line
	do
		# get the directory of the github repository
		link="${line##*/}"
		repo_path="${link%.*}"
		git clone $line
		cd "$repo_path"
		git log >> "${path}/logs.txt"
		#git log > logs.txt
	done < test.txt
#GitHub_links.txt

}

collect_logs
