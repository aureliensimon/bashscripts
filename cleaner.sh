#!/bin/bash

# TODO : difference KB, MB, GB

# total space saved
totalSpace=0
space=0
size=0
unit='KB'

# echo success message
printDone () {
	echo 'Done ! (' $1 ' saved )'
}

# convert to KB
convertToKB () {
	if [ "$1" == "M" ]; then
		space=$(($space * 1024))
	elif [ "$1" == "G" ]; then
		space=$(($space * 1048576))
	fi
}

# Choose best unit
chooseUnit () {
	if [ $1 -gt 1048576 ]; then
		totalSpace=$(($totalSpace / 1048576))
		unit='GB'
	elif [ $1 -gt 1024 ]; then
		echo 'scale=2;20+5/2' | bc
		totalSpace=$(($totalSpace / 1024))
		unit='MB'
	fi
}

# Clear APT cache
echo 'Clear APT cache ...'

cache=$(du -sh /var/cache/apt | grep -o '^\S*')
space=$(du -sh /var/cache/apt | grep -o '[0-9]*')
size=$(du -sh /var/cache/apt | grep -o '^\S*' | grep -o [a-Z]*)
convertToKB $size
totalSpace=$[totalSpace + space]

apt-get clean
printDone $cache

# Clearing journal logs
echo 'Clear journal logs > 3 days old ...'

journal=$(journalctl --disk-usage | grep -Eo '[0-9]+\.[0-9]+[a-Z]*')
space=$(journalctl --disk-usage | grep -o "[0-9]*" | head -n 1)
size=$(journalctl --disk-usage | grep -Eo '[0-9]+\.[0-9]+[a-Z]*' | grep -o [a-Z]*)
convertToKB $size
totalSpace=$[totalSpace + space]

journalctl --vacuum-time=3d > /dev/null 2>&1
printDone $journal

# Print total saved space
chooseUnit $totalSpace
echo 'Total saved space :' $totalSpace $unit
