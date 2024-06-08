#!/usr/bin/bash

set -ouex pipefail

tag=curl -sL https://api.github.com/repos/ublue-os/bluefin/releases/latest | jq -r ".tag_name"
url=

cd "$CONFIG_DIRECTORY/scripts"
# Make every script executable
find "$PWD" -type f -exec chmod +x {} \;
for SCRIPT in "${SCRIPTS[@]}"; do
    echo "Running script $SCRIPT"
    "$PWD/$SCRIPT"
done