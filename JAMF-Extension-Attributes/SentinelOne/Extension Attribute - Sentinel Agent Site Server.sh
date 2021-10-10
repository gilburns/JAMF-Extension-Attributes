#!/bin/sh

# Returns the SentinelOne Site Server to JAMF inventory.
# The site server can be found in the Site Token with this command line:
#       echo "YOUR_SITE_TOKEN" | base64 --decode
#
# Compare the value from the token to the value reported in JAMF to make sure your
# machines are connected to the correct S1 site.
#


#PROCESS
if command -v sentinelctl 1>/dev/null; then
    s1_sitekey=$(sentinelctl status --filters Management | awk -F"Server:" '/Server:/{print $2}' | xargs)
    if [ ! -z "$s1_sitekey" ];then
		echo "<result>$s1_sitekey</result>";
	else
		echo "<result>No Results</result>";
    fi
else
    echo "<result>Not Found</result>";
fi