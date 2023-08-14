#!/bin/bash
# This script will collect the contributors' names and return a list of all the contributors that contribute to that project on GitHub

echo "====================== The script is start ======================"
path=$(pwd)
#while read line ; do echo ${line##*/} ; done < GitHub_links.txt
> logs.txt
> authors.txt
collect_logs(){
	while read line
	do
		if [[ -n $line ]]; then
			# Get the directory of the GitHub repository
			link="${line##*/}"
			repo_path="${link%.*}"

			# Download the repository
			git clone $line

			# Change the directory to the repository path and get the logs of that repository
			cd "${repo_path}"
			git log >> "${path}/logs.txt"
			cd "${path}"
			grep "Author" logs.txt >> authors.txt

			echo "${repo_path}"
			rm -rf "${repo_path}"

			# Filter the logs
		else
			continue
		fi
	done < GitHub_links.txt
}

collect_logs

echo "====================== The script is finished ======================"
