#!/bin/bash

readonly server_service_name=minecraft-forge-server
readonly server_directory=/opt/minecraft_forge_server
readonly profile_filepath=/etc/minecraft.d/profile.conf


function init() {
	if ! dpkg -l | grep -q "libxml2-utils"; then
		echo "Installing library ..."
		apt-get -qq update && apt-get -qq install libxml2-utils 
	fi
}

function startServer() {
	echo "Starting Minecraft Forge Server ..."
	if ! systemctl start ${server_service_name}; then
		echo "ERROR: Failed to start Minecraft Forge Server."
	fi
}

function stopServer() {
	service_status=$(systemctl is-active ${server_service_name})
	if [ "$service_status" = "active" ]; then
		echo "Stopping Minecraft Forge Server ..."
		if ! systemctl stop ${server_service_name}; then
        	echo "ERROR: Failed to stop Minecraft Forge Server."
			exit 1
		fi
	fi
}

function detectUrl() {
	local version=$1

	url=$(curl -so- https://files.minecraftforge.net/net/minecraftforge/forge/index_${version}.html | xmllint --xpath '//table[@class="download-list"]/tbody/tr/td/ul/li/a[contains(@href,"-installer.jar")][not(contains(@href,"&"))]/@href' --html - 2> /dev/null | grep 'href=' | grep '\-installer' | head -1 | sed 's/[^"]*"\([^"]*\)"[^"]*/\1/g')
	if [ "$url" == "" ]; then
		echo "ERROR: Installer was not found for the version: ${version}"
		exit 1
	fi

	temp_jarpath="/tmp/$(basename ${url})"
}

function downloadFile() {
	echo "Downloading Minecraft Forge Server ..."
	
    if ! wget -q -O ${temp_jarpath} ${url}; then
        echo "ERROR: Cannot download file: ${url}"
        exit 1
    fi
}

function installServer() {
	local version=$1
	local base_version=$(echo $version | sed 's/\([0-9]*\.[0-9]*\)\..*/\1/')

	echo "Installing Minecraft Forge Server ..."
	sudo -u minecraft java -jar ${temp_jarpath} --installServer ${server_directory} | grep -E "^[A-Z][a-z]+ing" > /dev/null && \
		sed -i "s/^MINECRAFT_VERSION=.*/MINECRAFT_VERSION=${version}/" "${profile_filepath}" && \
		sed -i "s/^MINECRAFT_EDITION=.*/MINECRAFT_EDITION=forge-${base_version}/" "${profile_filepath}" && \
		echo "Installation has completed."
}


function cleanup() {
    rm ${temp_jarpath}
}

function main() {
    if [ ${#} -eq 1 ]; then
		version=$1

		version_pattern="^[0-9]+(\.[0-9]+)+$"
		if [[ !("$version" =~ $version_pattern) ]]; then
			echo "ERROR: Invalid version format: ${version}"
			exit 1
		fi

		init
		detectUrl ${version}
		downloadFile
		stopServer
		installServer ${version}
		startServer
		cleanup
    else
		echo "Usage: install.sh [VERSION]"
        exit 1
    fi
}

main "$@"