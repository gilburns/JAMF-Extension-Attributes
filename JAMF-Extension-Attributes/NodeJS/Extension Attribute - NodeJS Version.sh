#!/bin/bash

# Tests to see if Node.js is installed. If it is, it outputs the version number. If it’s not, it states that Node.js is not installed.

if [ -f "/usr/local/bin/node" ]
then
	NODE_VERS=$(/usr/local/bin/node -v)
	FIRST_CHARACTER=${NODE_VERS:0:1}

	if [ "${FIRST_CHARACTER}" == "v" ]; then
		NODE_VERS="${NODE_VERS:1}"
	fi	
    echo "<result>${NODE_VERS}</result>"
else
    echo "<result>Not installed</result>"
fi