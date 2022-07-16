#!/bin/sh

sudo pacman -Sy expac fzf pacman-contrib --needed --silent --noconfirm

git clone "https://github.com/excalibur1234/pacui"

cd pacui

bash pacui
