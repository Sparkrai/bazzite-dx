#!/usr/bin/bash

set -ouex pipefail

# Starship Shell Prompt
curl -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin
# shellcheck disable=SC2016
echo 'eval "$(starship init bash)"' >> /etc/bashrc
echo 'eval "$(starship init zsh)"' >> /etc/zshrc

# Topgrade Install
pip install --prefix=/usr topgrade

# Consolidate Just Files
find /tmp/files/just -iname '*.just' -exec printf "\n\n" \; -exec cat {} \; >> /usr/share/ublue-os/just/60-custom.just