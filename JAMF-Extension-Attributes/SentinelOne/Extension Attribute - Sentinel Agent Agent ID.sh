#!/bin/sh

# Returns the SentinelOne Agent ID to JAMF inventory.
#

#PROCESS
if command -v sentinelctl 1>/dev/null; then
	export LANG="en_US.UTF-8"
	export LC_TIME=en_US date
	s1_sitekey=$(sentinelctl status --filters Agent | awk -F"ID:" '/ID:/{print $2}' | xargs)
    if [ ! -z "$s1_sitekey" ];then
		echo "<result>$s1_sitekey</result>";
	else
		echo "<result>No Results</result>";
    fi
else
    echo "<result>Not Found</result>";
fi