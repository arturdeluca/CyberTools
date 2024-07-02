#!/bin/bash

# A tool created to brute force directories and files in an specified URL

# DISCLAMER:
# This tool was created to be used in test environments.
# The author is not responsible for any malicious use of this tool.
echo ""
echo "██████╗ ██████╗ ██╗   ██╗████████╗██╗   ██╗███████╗"
echo "██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██║   ██║██╔════╝"
echo "██████╔╝██████╔╝██║   ██║   ██║   ██║   ██║███████╗"
echo "██╔══██╗██╔══██╗██║   ██║   ██║   ██║   ██║╚════██║"
echo "██████╔╝██║  ██║╚██████╔╝   ██║   ╚██████╔╝███████║"
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚══════╝"
echo "                   Creator: s4rTu"
echo ""

echo "Script name: $0"
echo "$# arguments"
echo ""

if [ $# -eq 2 ]
then
	for word in $(cat $1)
	do
		resp=$(curl -s -H "User-Agent: bowser" -o /dev/null -w "%{http_code}" $2/$word/)
		resp2=$(curl -s -H "User-Agent: bowser" -o /dev/null -w "%{http_code}" $2/$word)
		if [ $resp == "200" ]
		then
			echo "$2/$word/ ==========> FOUND [CODE 200]"
		elif [ $resp2 == "200" ]
		then 
			echo "$2/$word ==========> FOUND [CODE 200]"
		elif [ $resp == "301" ]
		then
			echo "$2/$word/ ==========> REDIRECTED [CODE 301]"
		elif [ $resp2 == "301" ]
                then    
                        echo "$2/$word ==========> REDIRECTED [CODE 301]"
		fi
	done

elif [ $# -eq 3 ]
then
	echo "LOOKING FOR FILES WITH THIS EXTENSION: $3"
	echo ""
	for word in $(cat $1)
	do
		resp=$(curl -s -H "User-Agent: bowser" -o /dev/null -w "%{http_code}" $2/$word.$3)
		if [ $resp == "200" ]
		then
			echo "$2/$word.$3 ---------------> FOUND [CODE 200]"
		elif [ $resp == "301" ]
		then
			echo "$2/$word.$3 ---------------> REDIRECTED [CODE 301]"
		#else
			#echo $response $2/$word.$3
		fi
	done

else
	echo "Not enough parameters"
	echo "Usage: ./bf.sh WORDLIST URL => for testing directories and files with exact name"
	echo "Usage: ./bf.sh WORDLIST URL EXTENSION = for testing files with the desired extensions"
fi



