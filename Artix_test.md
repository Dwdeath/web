#!/bin/sh

sudo pacman -Sy sed cat git curl wget micro doas python --noconfirm

#Add repos

PAC="/etc/pacman.conf"

#default of PAC is: "/etc/pacman.conf"

sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'


#sudo sed -i -e 's/[system]/#[system]/g' /etc/pacman.conf
#sudo sed -i -e 's/[world]/#[world]/g' /etc/pacman.conf
#sudo sed -i -e 's/[galaxy]/#[galaxy]/g' /etc/pacman.conf
#sudo sed -i -e 's/[lib32]/#[lib32]/g' /etc/pacman.conf

#sudo sed -i -e 's/#Include/Include/g' /etc/pacman.conf
#sudo sed -i -e 's/Include/#Include/g' /etc/pacman.conf



sudo cat << 'END' << $PAC

# Artix
[system]
Include = /etc/pacman.d/mirrorlist

[world]
Include = /etc/pacman.d/mirrorlist

[galaxy]
Include = /etc/pacman.d/mirrorlist

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
Server = http://omniverse.artixlinux.org/$arch

END

sudo pacman -Sy yay --noconfirm

yay -Sy artix-archlinux-support

sudo cat << 'END2' << $PAC
# Arch
[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

[multilib]
Include = /etc/pacman.d/mirrorlist-arch

# Others
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist

END2

yay -Rd epiphany parole --noconfirm
yay -Syyuu kwin systemsettings ark librewolf smplayer smplayer-themes audacious rtl88x2bu-cilynx-dkms-git --noconfirm

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
sudo xfconf-query --channel thunar --property /misc-exec-shell-scripts-by-default --create --type bool --set true

# activate the leatest gaming script (not mine!)
curl --tlsv1.2 -fsSL https://raw.githubusercontent.com/YurinDoctrine/ultra-gaming-setup-wizard/main/ultra-gaming-setup-wizard.sh >ultra-gaming-setup-wizard.sh && \
 chmod 0755 ultra-gaming-setup-wizard.sh && \
 ./ultra-gaming-setup-wizard.sh
