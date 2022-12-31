#!/bin/bash

LAPS="/usr/local/laps/macOSLAPS"

if [ -f "$LAPS" ]; then
	MY_VERSION=$("$LAPS" -version)
else
	MY_VERSION="Not Installed"
fi

echo "<result>$MY_VERSION</result>"