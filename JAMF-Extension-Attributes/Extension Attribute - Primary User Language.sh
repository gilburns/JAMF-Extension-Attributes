#!/bin/bash

# Extension Attribute - Primary User Language

# Save the last reported language to a local plist
LAST_CHECK_PLIST="com.company.languagecheck"


LOGGED_IN_USER=$( scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

# Check language setting for logged in user
#
if [[ "$LOGGED_IN_USER" != "" ]]; then
	if [ -f "/Users/${LOGGED_IN_USER}/Library/Preferences/.GlobalPreferences.plist" ]; then
		PRIMARY_LANGUAGE=$(/usr/libexec/PlistBuddy -c 'Print AppleLanguages:0' "/Users/${LOGGED_IN_USER}/Library/Preferences/.GlobalPreferences.plist")
		if [[ "${PRIMARY_LANGUAGE}" != "" ]]; then
			result="${PRIMARY_LANGUAGE}"
		fi
	fi
fi

# If no language is available for the logged in user, check the system setting.
#
if [ -z "${result}" ]; then
	if [ -f "/Library/Preferences/.GlobalPreferences.plist" ]; then
		PRIMARY_LANGUAGE=$(/usr/libexec/PlistBuddy -c 'Print AppleLanguages:0' "/Library/Preferences/.GlobalPreferences.plist")
		if [[ "${PRIMARY_LANGUAGE}" != "" ]]; then
			result="${PRIMARY_LANGUAGE}"
		else
			result="Not Set"
		fi
	else
		PREVIOUS_LANGUAGE=$(/usr/bin/defaults read "/Library/Preferences/${LAST_CHECK_PLIST}" LanguageLastCheck 2>/dev/null)
		if [[ "${PREVIOUS_LANGUAGE}" != "" ]]; then
			result="${PREVIOUS_LANGUAGE}"
		else
			result="Unknown"
		fi
	fi
fi

# Save to a local file
#
/usr/bin/defaults write "/Library/Preferences/${LAST_CHECK_PLIST}" LanguageLastCheck "${result}" &>/dev/null

echo "<result>${result}</result>"