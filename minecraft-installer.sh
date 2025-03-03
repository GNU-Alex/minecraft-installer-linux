#!/bin/bash
#!/bin/bash
# =====================================
# ======== Minecraft Installer ========
# =====================================
# Version : 1.1
# Author : GNU/Alex
# Description : Script for installing Minecraft
# on non-Debian/Arch Distributions.
# =====================================


filename="minecraft.tar.gz"
filename_icon="minecraft-launcher.svg"
url="https://launcher.mojang.com/download/Minecraft.tar.gz"
install_dir="$HOME/.local/bin"
icon_dir="$HOME/.icons/hicolor/symbolic/apps"
desktop_file="$HOME/.local/share/applications/minecraft-launcher.desktop"

# Create the installation directory if it doesn't exist
mkdir -p "$install_dir"
mkdir -p "$icon_dir"

echo "Downloading..."
# Getting Minecraft launcher from "Other" option on page minecraft.net/download
wget -q --show-progress -O "$filename" "$url"
wget -q --show-progress -O "$icon_dir/$filename_icon" "https://raw.githubusercontent.com/GNU-Alex/minecraft-installer-linux/main/minecraft-launcher.svg"

echo "Download complete."

# Decompressing minecraft.tar.gz
echo "Decompressing $filename"
tar -xzvf "$filename"
echo "Decompressing done."

# Moving archive
echo "Moving archive..."
mv minecraft-launcher/minecraft-launcher "$install_dir/"
rm -rf minecraft-launcher/
echo "Moving launcher Icon..."
mv "$icon_dir/$filename_icon" "$icon_dir/"
echo "Moving complete..."

# Creating .desktop file
echo "Creating .desktop file..."
cat > "$desktop_file" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Minecraft Launcher
Comment=Official Minecraft Launcher
Exec=$install_dir/minecraft-launcher
Icon=$icon_dir/$filename_icon
Terminal=false
Categories=Game;Application;
StartupWMClass=minecraft-launcher
EOF

echo ".desktop file created at $desktop_file"

# Removing .tar.gz archive
echo "Removing $filename"
rm "$filename"
