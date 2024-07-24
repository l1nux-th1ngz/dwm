#!/bin/bash

# Update
sudo apt update

sudo apt-get install -y curl wget

mkdir -pv ~/.local/src && cd ~/.local/src
git clone https://github.com/DavidVogelxyz/debian-dwm && cd ~/.local/src/debian-dwm
bash debian-dwm.sh

sudo-apt-get install -y xdg-user-dirs xdg-user-dirs-gtk

# Update user directories
xdg-user-dirs-update
sleep 2
xdg-user-dirs-gtk-update
sleep 2

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile complete --default-toolchain nightly

# Install essential packages
sudo apt install -y xorg xserver-xorg xbacklight xbindkeys xvkbd xinput build-essential
sudo apt install -y git curl wget xdg-user-dirs xdg-user-dirs-gtk cmus vlc uxplay cava 
sudo apt install -y kitty alacritty bluez npm blueman geany geany-plugins notepadqq udisks2 
sudo apt install -y udiskie zenity yad xdotool dunst libnotify-bin zip unzip rofi polybar 
sudo apt install -y scrot feh maim slop pipewire gvfs gvfs-backends acpi acpid avahi-daemon
sudo apt install -y dosfstools mtools dex dialog network-manager playerctl brightnessctl 
sudo apt install -y dconf-editor acpi arandr autorandr duf font-manager hwinfo hw-probe 
sudo apt install -y lolcat lxappearance most numlockx ripgrep suckless-tools sxhkd 
sudo apt install -y libimlib2-dev libx11-dev libxft-dev libxinerama-dev libfreetype6-dev 
sudo apt install -y libfontconfig1-dev silversearcher-ag obs-studio qbittorrent rxvt-unicode
sudo apt install -y simplescreenrecorder sublime-text libconfig-dev libdbus-1-dev libegl-dev 
sudo apt install -y libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev
sudo apt install -y libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev 
sudo apt install -y libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev 
sudo apt install -y libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev make
sudo apt install -y libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build 
sudo apt install -y	python3 python3-pip python3-venv python3-v-sim uthash-dev cmake
sudo apt install -y python-dbus-dev libpangocairo-1.0-0 python3-cairocffi cmake-extras
sudo apt install -y python3-xcffib libxkbcommon-dev libxkbcommon-x11-dev
sudo apt install -y --no-install-recommends gdm3

# Enable GDM3
sudo systemctl enable gdm3
echo "GDM3 has been installed and enabled."

# Picom
git clone https://github.com/FT-Labs/picom
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install

# Vivaldi and Java packages
wget https://downloads.vivaldi.com/stable/vivaldi-stable_6.8.3381.48-1_amd64.deb
wget https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb

# Install downloaded packages
sudo dpkg -i vivaldi-stable_6.8.3381.48-1_amd64.deb
sudo dpkg -i jdk-22_linux-x64_bin.deb
sudo dpkg -i jdk-21_linux-x64_bin.deb
sudo dpkg -i jdk-17_linux-x64_bin.deb

# Configure Rofi and Polybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/polybar
echo "Configure your Rofi and Polybar settings in ~/.config/rofi and ~/.config/polybar respectively."
echo "[Desktop Entry]
Type=Application
Exec=polybar
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Polybar
Name=Polybar
Comment[en_US]=
Comment=" > ~/.config/autostart/polybar.desktop

echo "Setup complete."
