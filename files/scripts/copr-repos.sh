#!/usr/bin/bash

set -ouex pipefail

# Re-enable RPMFusion
sed -i '0,/enabled=0/s//enabled=1/' /etc/yum.repos.d/rpmfusion-{,non}free.repo
sed -i '0,/enabled=0/s//enabled=1/' /etc/yum.repos.d/rpmfusion-{,non}free-updates.repo
sed -i '0,/enabled=0/s//enabled=1/' /etc/yum.repos.d/rpmfusion-{,non}free-updates-testing.repo