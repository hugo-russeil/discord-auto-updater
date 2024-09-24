#!/bin/bash

# Script to update Discord to the latest version

function update(){
    curl -L -o discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"

    while [ ! -f "discord.deb" ]
    do
        sleep 1
    done

    sudo dpkg -i discord.deb
    rm discord.deb
    echo "Discord has been updated to the latest version."
}

# Checking the installed version
installed_version=$(dpkg -s discord | grep '^Version:' | awk '{print $2}')

# Asking snap for the latest version
latest_version=$(snap info discord | grep stable | awk '{print $2}')

# If the user wants to force the update without performing the version check
if [ "$1" == "--force" ]; then # Implemented this because snap somehow doesn't always know there has been an update
    echo "Forcing update..."   # which can lead to the script insisting that Discord is up to date when it isn't
    update
    exit 0
else

    # Else, check if the installed version is the latest
    # Compare the versions and checks if the installed version is at least the same as the latest version
    if [[ "$(printf '%s\n' "$installed_version" "$latest_version" | sort -V | head -n 1)" != "$installed_version" ]]; then
        echo "Discord is up to date."
        discord > /dev/null 2>&1 &
    # Updating Discord
    else
        echo "Discord is not up to date. Installed version: $installed_version, Latest version: $latest_version"
        update
        discord > /dev/null 2>&1 &
        
    fi
fi
