#!/bin/bash

echo "Hello im script $0"
echo ""

if [ $# -gt 0 ]; then
	SCRIPT_ARGS=($@)
	for((i=0; i<${#SCRIPT_ARGS[*]}; i++)); do
		echo "arg$(($i+1)) is ${SCRIPT_ARGS[i]}. And its content is/are:"
		cat "${SCRIPT_ARGS[i]}"
		echo ""
	done
fi