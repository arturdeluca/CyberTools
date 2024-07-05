#!/bin/bash

# Script to find alias for in CNAME
# Disclaimer
#This script was created for test purposes only. The creator is not responsible for the use of it in a malicious way

echo ""
echo "$0"
echo ""

if [[ $# -eq 2 ]]
then
	for word in $(cat $2);
	do
		host -t cname $word.$1 | grep "alias for"
	done
else
	echo "Wrong Use. Please make sure to provida a valid URL and a wordlist"
	echo "Usage: ./cname.sh URL WORDLIST"
fi
