#!/bin/bash

# Checks current state of Xcode Command Line Tools installation.
xcodeCheck=$(/usr/sbin/pkgutil --pkg-info=com.apple.pkg.CLTools_Executables | grep "version" | cut -d' ' -f2 2>&1)

if [ ! -z "$xcodeCheck" ]; then
	result="$xcodeCheck"
else
	result="Missing"
fi

echo "<result>$result</result>"