#!/usr/bin/env bash

set -e

if [ $(uname -m) == 'x86_64' ] 
then
	a=amd64
elif [ $(uname -m) == 'aarch64' ] 
then 
	a=:arm64
elif [ $(uname -m) == 'armhf' ] 
then 
	a=:armhf
else
	echo 'not matched platform!'
	exit 0
fi

apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=$a] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
apt-get update && sudo apt-get install -y docker-ce

usermod -aG docker $USER
