PAC="/etc/pacman.conf"

#default of PAC is: "/etc/pacman.conf"

echo "[pirate-arch-repo]" >> $PAC
echo "" >> $PAC
echo "SigLevel = Optional DatabaseOptional" >> $PAC
echo >> "Server = https://raw.githubusercontent.com/AbdelrhmanNile/pirate-arch-repo/main/x86_64" >> $PAC

pacman -Syy
