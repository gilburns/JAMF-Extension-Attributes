#!/bin/zsh

# Detects and reports the default mail hander application for the logged in user
SWDA_PATH="/Library/Management/Tools/swda"

# Logged in user
CURRENT_USER=$(/usr/bin/stat -f%Su /dev/console)

if [ -f "${SWDA_PATH}" ]; then
	DEFAULT_MAIL=$(/usr/bin/su "$CURRENT_USER" -c "$SWDA_PATH getHandler --browser")
else 
	DEFAULT_MAIL="SWDA Tool Missing"
fi

echo "<result>${DEFAULT_MAIL}</result>"