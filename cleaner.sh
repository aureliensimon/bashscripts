#!/bin/bash

# TODO : difference MB, GB

# total space saved
totalSpace=0

# echo success message
printDone () {
	echo 'Done ! (' $1 ' saved )'
}

# Clear APT cache
echo 'Clear APT cache ...'

cache=$(du -sh /var/cache/apt | grep -o '^\S*')
spaceCache=$(du -sh /var/cache/apt | grep -o '[0-9]*')
totalSpace=$[totalSpace + spaceCache]

apt-get clean
printDone $journal

# Clearing journal logs
echo 'Clear journal logs > 3 days old ...'

journal=$(journalctl --disk-usage | grep -Eo "[0-9]+\.[0-9]+[a-Z]*")
spaceJournal=$(journalctl --disk-usage | grep -o "[0-9]*" | head -n 1)
totalSpace=$[totalSpace + spaceJournal]

journalctl --vacuum-time=3d > /dev/null 2>&1
printDone $journal

# Print total saved space
echo 'Total saved space :' $totalSpace
