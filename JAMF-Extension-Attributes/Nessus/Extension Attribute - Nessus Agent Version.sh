#!/bin/sh

# Check to see if Nessus Agent is installed
NessusAgentInstalled="$(ls /Library/NessusAgent/run/bin/ | grep nasl)"
if [ "$NessusAgentInstalled" != "nasl" ]; then
	echo "<result>Not Installed</result>"
else 
	NessusAgentVersion="$(/Library/NessusAgent/run/bin/nasl -v | grep Agent | cut -d' ' -f3)"
	echo "<result>$NessusAgentVersion</result>"
fi