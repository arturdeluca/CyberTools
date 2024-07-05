#!/bin/bash

# Subdomain DNS Resolver
# Disclaimer
# This script was created for test purposes only. The author is not responsible for malicious use of this script.

echo " _____  __ __  _____  _____  _____  _____"
echo "/  ___>/  |  \/  _  \/  _  \/   __\/  ___>"
echo "|___  ||  |  ||  _  <|  _  <|   __||___  |"
echo "<_____/\_____/\_____/\__|\_/\_____/<_____/"
echo "             Creator: s4rTu"

echo ""

if [[ $# -eq 2 ]]
then
	for word in $(cat $2);
	do
		host $word.$1 | grep -v "NXDOMAIN"
	done
else
	echo "Wrong parameters. Make sure you are providing a valid URL and a wordlist"
	echo "Usage: ./subdomain.sh WEBSITE WORDLIST"
fi

