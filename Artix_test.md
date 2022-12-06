#!/bin/sh

sudo pacman -Sy git curl wget micro doas
#-Add repos-

PAC="/etc/pacman.conf"

#default of PAC is: "/etc/pacman.conf"

sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "" >> $PAC
echo"
# Artix
#__[system]
#__Include = /etc/pacman.d/mirrorlist

#__[world]
#__Include = /etc/pacman.d/mirrorlist

#__[galaxy]
#__Include = /etc/pacman.d/mirrorlist

#__[lib32]
#__Include = /etc/pacman.d/mirrorlist

[universe]
Server = https://universe.artixlinux.org/$arch
Server = https://mirror1.artixlinux.org/universe/$arch
Server = https://mirror.pascalpuffke.de/artix-universe/$arch
Server = https://artixlinux.qontinuum.space/artixlinux/universe/os/$arch
Server = https://mirror1.cl.netactuate.com/artix/universe/$arch
Server = https://ftp.crifo.org/artix-universe/

[omniverse]
Server = http://omniverse.artixlinux.org/$arch

# Arch
#__[extra]
#__Include = /etc/pacman.d/mirrorlist-arch

#__[community]
#__Include = /etc/pacman.d/mirrorlist-arch

#__[multilib]
#__Include = /etc/pacman.d/mirrorlist-arch

# Others
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
" >> $PAC

sudo pacman -Sy yay

yay -Syyuu rtl88x2bu-cilynx-dkms-git
