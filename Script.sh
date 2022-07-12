#!/bin/bash

# This script will collect the contributers names and return a list of all the contributers tha contribute to that project in GitHub

path=$(pwd)
#while read line ; do echo ${line##*/} ; done < GitHub_links.txt
> logs.txt
> authors.txt
cat logs.txt
collect_logs(){
	while read line
	do
		if [[ -n $line ]]; then
			# get the directory of the github repository
			link="${line##*/}"
			repo_path="${link%.*}"

			#download the repository
			git clone $line

			# change the directory to the repository and get the logs of that repository
			cd "${repo_path}"
			git log >> "${path}/logs.txt"
			cd "${path}"
			grep "Author" logs.txt >> authors.txt

			echo "${repo_path}"
			rm -r "${repo_path}"

			# filter the logs
		else
			continue
		fi
	done < test.txt
#GitHub_links.txt

}

collect_logs
