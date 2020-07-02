#!/bin/bash

usage () {
	echo "${0} [suite-file program]"
	exit 1
}

output () {
	for case in $(cat ${1}); do
		echo ${case}
		if [ -f "${case}.args" ]; then
			args=$(cat "${case}.args")
			if [ -f "${case}.in" ]; then
				${2} ${args} < "${case}.in" > "${case}.out"
			else
		                ${2} ${args} > "${case}.out"	
			fi
		else
			if [ -f "${case}.in" ]; then
				${2} < "${case}.in" > "${case}.out"
			else
				${2} > "${case}.out"
			fi
		fi
	done	
} 	

if [ $# -ne 0 -a $# -ne 2 ]; then 
	usage
fi
output $1 $2
