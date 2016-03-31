#!/bin/bash
# https://docs.docker.com/engine/installation/linux/debian/
# new (clean) installation of Docker i.e., sequence of commands if no errors.
apt-get update
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
apt-get update
apt-cache policy docker-engine
deb https://apt.dockerproject.org/repo debian-jessie main
apt-get update
apt-cache policy docker-engine
sudo apt-get update
sudo apt-get install docker-engine
sudo service docker start
sudo docker run hello-world

# Unfortuntely, I wasn't luck...Troubleshooting motes
apt-get install apt-transport-https ca-certificates

# E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)
# E: Unable to lock the administration directory (/var/lib/dpkg/), are you root?
# pi@raspberrypi:~ $ su apt-get install apt-transport-https ca-certificates

# Google...found this - for password help: https://www.raspberrypi.org/documentation/linux/usage/users.md
# Try this:
su -
password

apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Open the /etc/apt/sources.list.d/docker.list file in your favorite editor. If the file doesn’t exist, create it.
deb https://apt.dockerproject.org/repo debian-jessie main

lsb_release -a
# Distributor ID:	Raspbian
# Description:	Raspbian GNU/Linux 8.0 (jessie)
# Release:	8.0
# Codename:	jessie

sudo apt-get update
# W: GPG error: https://apt.dockerproject.org debian-jessie Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY F76221572C52609D
# W: Failed to fetch https://apt.dockerproject.org/repo/dists/debian-jessie/main/binary-armhf/Packages  HttpError403  E: Some index files failed to download. They have been ignored, or old ones used instead.

# for help with error: http://ccm.net/faq/809-debian-apt-get-no-pubkey-gpg-error
# NO_PUBKEY F76221572C52609D
# Solution - Simply type the following commands, taking care to replace the number below with that of the key that was displayed in the error message:
gpg --keyserver pgpkeys.mit.edu --recv-key  F76221572C52609D
gpg -a --export F76221572C52609D | sudo apt-key add -

sudo apt-get update
# W: Failed to fetch https://apt.dockerproject.org/repo/dists/debian-jessie/Release  Unable to find expected entry 'main/binary-armhf/Packages' in Release file (Wrong sources.list entry or malformed file)
# E: Some index files failed to download. They have been ignored, or old ones used instead.

sudo apt-get install docker-engine
# E: Unable to locate package docker-engine

# troubleshoot links:
# https://forums.docker.com/t/unable-to-find-install-docker-engine/3795
# https://docs.docker.com/installation/debian/#debian-jessie-80-64-bit

# As of now Docker deamon only has packages available for 64 bit Linux hosts. Docker client works on both 32 bit and 64 bit Machines. So you should try the installation on a 64bit debian box.
$ uname -r
# 4.1.17-v7+

# couldn't tell if 32 or 64, goolgle, try https://linuxconfig.org/check-what-debian-version-you-are-running-on-your-linux-system
cat /etc/issue
# Raspbian GNU/Linux 8 \n \l
# what does this mean?  still can't tell if 32 or 64 bit.

cat /etc/debian_version
# 8.0
# doesn't tell me anything ghrrrr

uname -a
# Linux raspberrypi 4.1.17-v7+ #838 SMP Tue Feb 9 13:15:09 GMT 2016 armv7l GNU/Linux
# what is #838?

# install lsb command, see if that helps...
sudo apt-get install lsb-release
lsb_release -da
# No LSB modules are available.
# Distributor ID:	Raspbian
# Description:	Raspbian GNU/Linux 8.0 (jessie)
# Release:	8.0
# still no help with regard to 32 or 64 , google 32 or 64 for my Raspberry PI 2B
# http://raspberrypi.stackexchange.com/questions/34715/is-raspbian-for-the-raspberry-pi-2-b-32-bit-or-a-64-bit-os
# here's the answer:
# It is a 32 bit OS, as all current Raspberry Pi hardware (except the new Raspberry Pi 3) uses 32 bit ARM CPUs.

# solution, buy Raspberry Pi3 from Amazon and try again.
# https://www.debian.org/distrib/
