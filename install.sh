#!/bin/bash

echo Creating directories..
mkdir ~/Downloads ~/Pictures ~/Repos ~/Scripts ~/.config

echo Installing necessary packages..
paru -Syu --needed wtype waybar hyprland wofi-hg foot grimblast-git stow cliphist eza python-pywal nerd-fonts hyprlock hypridle wlsunset pavucontrol less bat tldr man-db zoxide zed chafa mdcat bibata-cursor-theme adw-gtk3 yazi mpv perl-image-exiftool btop dunst fzf swaybg python-pillow git cowfortune xdg-desktop-portal-hyprland gsettings-desktop-schemas qt5 qt6 wl-clipboard wireplumber easyeffects base-devel powertop nvtop pandoc-cli lesspipe

echo Running stow on user files..
stow --adopt -R -v -t ~ user/
git restore .

echo Setting gtk theme..
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# echo Running stow on root files..

