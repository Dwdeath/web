#!/bin/sh

pacman -Sy git --needed --noconfirm
pacman -S curl --needed --noconfirm

git clone "https://github.com/astos/astos"
cd astos

mkfs.fat -F32 /dev/nvme0n1p1
mkfs.btrfs -f /dev/nvme0n1p2

python3 main.py /dev/nvme0n1p2 /dev/nvme0n1 /dev/nvme0n1p1
