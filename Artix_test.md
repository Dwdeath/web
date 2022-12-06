#!/bin/sh

sudo pacman -Sy sed git curl wget micro doas --noconfirm

#Add repos

PAC="/etc/pacman.conf"

#default of PAC is: "/etc/pacman.conf"

sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "" >> $PAC
echo"
# Artix
#_X_[system]
#_X_Include = /etc/pacman.d/mirrorlist

#_X_[world]
#_X_Include = /etc/pacman.d/mirrorlist

#_X_[galaxy]
#_X_Include = /etc/pacman.d/mirrorlist

#_X_[lib32]
#_X_Include = /etc/pacman.d/mirrorlist

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
#_X_[extra]
#_X_Include = /etc/pacman.d/mirrorlist-arch

#_X_[community]
#_X_Include = /etc/pacman.d/mirrorlist-arch

#_X_[multilib]
#__Include = /etc/pacman.d/mirrorlist-arch

# Others
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
" >> $PAC

sudo pacman -Sy yay --noconfirm

yay -Syyuu artix-archlinux-support rtl88x2bu-cilynx-dkms-git

# remove the #_X_ in /etc/pacman.conf
sudo sed -i -e 's/#_X_/ /g' /etc/pacman.conf

yay -Rd epiphany parole --noconfirm
yay -S kwin systemsettings ark librewolf smplayer smplayer-themes audacious  --noconfirm

# get ventoy script (important!) 
wget 'https://api.github.com/repos/ventoy/vtoyboot/releases/leatest' '~/Downloads/Scripts/run after every kernel update/'

# get owl wallpaper
wget https://w.wallhaven.cc/full/5w/wallhaven-5wmmg1.jpg ~/Pictures

# get theme for kde
wget 'https://github.com/yeyushengfan258/Afterglow-kde/archive/master.zip' ~/Downloads
wget 'https://github.com/yeyushengfan258/Afterglow-Cursors/archive/master.zip' ~/Downloads

# make files executable with double click:
sudo xfconf-query --channel thunar --property /misc-exec-shell-scripts-by-default --create --type bool --set true

