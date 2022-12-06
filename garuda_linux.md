#!/bin/sh

PAC="/etc/pacman.conf"

#default of PAC is: "/etc/pacman.conf"

pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

cat >> 'END' << $PAC

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
END
