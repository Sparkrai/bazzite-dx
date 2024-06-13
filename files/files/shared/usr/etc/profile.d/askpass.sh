#!/usr/bin/bash

IMAGE_INFO="/usr/share/ublue-os/image-info.json"
BASE_IMAGE_NAME=$(jq -r '."base-image-name"' < $IMAGE_INFO)

if [[ ${BASE_IMAGE_NAME} == 'bazzite' ]]; then
  SUDO_ASKPASS='/usr/bin/ksshaskpass'
elif [[ ${BASE_IMAGE_NAME} == 'bazzite-gnome' ]]; then
  SUDO_ASKPASS='/usr/libexec/openssh/gnome-ssh-askpass'
fi
export SUDO_ASKPASS
