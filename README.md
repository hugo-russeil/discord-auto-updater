# Ubuntu Discord Auto-Updater


This project provides a simple way to automatically update Discord on Ubuntu. It includes a Debian package that installs a script to check for updates and update Discord if necessary.


## Features


- Automatically checks for the latest version of Discord.
- Downloads and installs the latest version if an update is available.
- Runs automatically at startup.


## Installation


You can either build the Debian package or download the pre-built `.deb` file from the [releases page](https://github.com/hugo-russeil/ubuntu-discord-auto-updater/releases/).


### Option 1: Build the Debian package


1. Build the package:


    ```bash
    dpkg-deb --build discord-updater
    ```


2. Install the package:


    ```bash
    sudo dpkg -i discord-updater.deb
    ```


### Option 2: Download the pre-built `.deb` file


1. Download the latest `.deb` file from the [releases page](https://github.com/hugo-russeil/ubuntu-discord-auto-updater/releases/).
2. Install the package:


    ```bash
    sudo dpkg -i discord-updater.deb
    ```


## Usage


The updater script runs automatically at startup, and can also be run manually.


### Manual Update


To manually check for updates and update Discord, you can:


- Launch "Discord Updater" from your applications menu.


- Run the script directly:


    ```bash
    /usr/local/bin/discord-updater.sh
    ```


- Force an update if the script doesn't detect an update:


    ```bash
    /usr/local/bin/discord-updater.sh --force
    ```


### Automatic Update


The package includes a `.desktop` file that sets the updater to run automatically at startup. This file is installed to `/usr/share/applications/` and ensures the updater runs each time you log in.

## Disclaimer


I, the maintainer of this project, have no affiliation or relationship with Discord, Inc. This project is an independent open-source effort and is not endorsed or supported by Discord.

## License


This project is licensed under the [LICENSE](LICENSE).