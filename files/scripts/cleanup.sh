#!/usr/bin/bash

set -ouex pipefail

# Disable all COPRs and RPM Fusion Repos
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/negativo17-fedora-multimedia.repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/charm.repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/ublue-os-bling-fedora-"${OS_VERSION}".repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/ublue-os-staging-fedora-"${OS_VERSION}".repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_che-nerd-fonts-"${OS_VERSION}".repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_ublue-os-akmods.repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/fedora-cisco-openh264.repo

# DX specific
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/ganto-lxc4-fedora-"${OS_VERSION}".repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/karmab-kcli-fedora-"${OS_VERSION}".repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/atim-ubuntu-fonts-fedora-"${OS_VERSION}".repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/vscode.repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/docker-ce.repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo

for i in /etc/yum.repos.d/rpmfusion-*; do
    sed -i 's@enabled=1@enabled=0@g' "$i"
done