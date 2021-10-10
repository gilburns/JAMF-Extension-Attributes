#!/bin/sh

# Returns the SentinelOne Last Seen time to JAMF inventory.
#

#PROCESS
if command -v sentinelctl 1>/dev/null; then
	export LANG="en_US.UTF-8"
	s1_sitekey=$(sentinelctl status --filters Management | awk -F"Seen:" '/Seen:/{print $2}' | xargs)
    if [ ! -z "$s1_sitekey" ];then
		echo "<result>$s1_sitekey</result>";
	else
		echo "<result>No Results</result>";
    fi
else
    echo "<result>Not Found</result>";
fi