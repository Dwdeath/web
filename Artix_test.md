#!/bin/sh

pacman -Sy sed git curl wget micro doas python --noconfirm

 wget https://github.com/archlinux/svntogit-packages/raw/packages/pacman-mirrorlist/trunk/mirrorlist -O /etc/pacman.d/mirrorlist-arch

echo " 
# Artix
[lib32]
Include = /etc/pacman.d/mirrorlist

[universe]
Server = https://universe.artixlinux.org/$arch
Server = https://mirror1.artixlinux.org/universe/$arch
Server = https://mirror.pascalpuffke.de/artix-universe/$arch
Server = https://artixlinux.qontinuum.space/artixlinux/universe/os/$arch
Server = https://mirror1.cl.netactuate.com/artix/universe/$arch
Server = https://ftp.crifo.org/artix-universe/

[omniverse]
Server = http://omniverse.artixlinux.org/$arch" >> /etc/pacman.conf

pacman -Sy yay --noconfirm

pacman -Sy artix-archlinux-support --noconfirm

echo "
# Arch
[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

[multilib]
Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf

pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "
# Others
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf


#echo "
#[valveaur]
#Server = http://repo.steampowered.com/arch/valveaur
#
#[ashleyis]
#Server = http://arch.ashleytowns.id.au/repo/$arch
#
#" >> /etc/pacman.conf


pacman -Rd epiphany parole --noconfirm
pacman -Syyuu kwin systemsettings ark librewolf smplayer smplayer-themes audacious rtl88x2bu-cilynx-dkms-git --noconfirm

# get ventoy script (important! also not mine!) 
cd ~/Downloads
wget https://github.com/ventoy/vtoyboot/releases/download/v1.0.25/vtoyboot-1.0.25.iso

# get owl wallpaper (not mine!)
cd ~/Pictures
wget https://w.wallhaven.cc/full/5w/wallhaven-5wmmg1.jpg

# get theme for kde (not mine!)
cd ~/Downloads
wget 'https://github.com/yeyushengfan258/Afterglow-kde/archive/master.zip'
wget 'https://github.com/yeyushengfan258/Afterglow-Cursors/archive/master.zip' 

# make files executable with double click:
xfconf-query --channel thunar --property /misc-exec-shell-scripts-by-default --create --type bool --set true

# activate the leatest gaming script (not mine!)
curl --tlsv1.2 -fsSL https://raw.githubusercontent.com/YurinDoctrine/ultra-gaming-setup-wizard/main/ultra-gaming-setup-wizard.sh >ultra-gaming-setup-wizard.sh && \
 chmod 0755 ultra-gaming-setup-wizard.sh && \
 ./ultra-gaming-setup-wizard.sh
