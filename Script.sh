#!/bin/bash

# This script will collect the contributers names and return a list of all the contributers tha contribute to that project in GitHub

path=$(pwd)
#while read line ; do echo ${line##*/} ; done < GitHub_links.txt
touch logs.txt authors.txt
collect_logs(){
	while read line
	do
		# get the directory of the github repository
		link="${line##*/}"
		repo_path="${link%.*}"

		#download the repository
		git clone $line

		# change the directory to the repository and get the logs of that repository
		cd "$repo_path"
		git log >> "${path}/logs.txt"
		cd "$path"
		rm -r "$repo_path"

		# filter the logs
		grep "author" logs.txt >> authors.txt
	done < test.txt
#GitHub_links.txt

}

collect_logs
