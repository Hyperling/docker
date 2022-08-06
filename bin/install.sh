#!/bin/bash
# 2022-08-05 Hyperling
# Install docker from official repository. Currently only supports apt.
# Original comands came from here: https://docs.docker.com/engine/install/debian/
# usage: install.sh

apt purge docker docker-engine docker.io containerd runc

apt update &&
apt install -y ca-certificates curl gnupg lsb-release &&
mkdir -p /etc/apt/keyrings &&
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg &&
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&
apt update &&
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin &&
exit 0

echo "ERROR: Installation failed!"
exit 1

