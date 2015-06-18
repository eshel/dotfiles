#!/bin/bash

alias aptinstall="sudo apt-get install -y"

# Repositories
sudo add-apt-repository -y ppa:webupd8team/java # Oracle JDK updates

# Perform update & upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

# Install stuff
aptinstall dkms   # dynamic kernel modules, useful for virtualization
aptinstall ssh rsync
aptinstall vim
aptinstall preload    # predicts libraries to load in advance, supposed to accelerate stuff

# dev tools
aptinstall git gitg
aptinstall build-essential autoconf automake libtool cmake zlib1g-dev pkg-config libssl-dev
aptinstall bzip2 libbz2-dev


# Python

# Autoremove unnecessary stuff
sudo apt-get autoremove -y

