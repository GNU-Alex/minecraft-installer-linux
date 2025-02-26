#!/bin/bash

filename="Minecraft.tar.gz"
filename_icon="minecraft-launcher.png"
url="https://launcher.mojang.com/download/Minecraft.tar.gz"
install_dir="$HOME/.mojang"
desktop_file="$HOME/.local/share/applications/minecraft-launcher.desktop"

# Create the installation directory if it doesn't exist
mkdir -p "$install_dir"

echo "Downloading..."
# Getting Minecraft launcher from "Other" option on page minecraft.net/download
wget -q --show-progress -O $filename $url
wget https://github.com/GNU-Alex/minecraft-installer-linux/raw/main/minecraft-launcher.png
echo "Download complete."

# Decompressing minecraft.tar.gz
echo "Decompressing $filename"
tar -xjvf $filename
echo "Decompressing done."

# Moving archive
echo "Moving archive..."
mv minecraft-launcher/ "$install_dir/"
echo "Moving launcher Icon..."
mv $filename_icon "$install_dir/"
echo "Moving complete..."

# Creating .desktop file
echo "Creating .desktop file..."
cat > "$desktop_file" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Minecraft Launcher
Comment=Official Minecraft Launcher
Exec=$install_dir/minecraft-launcher/minecraft-launcher
# If you have a laptop with Nvidia GPU, use this line for launching Minecraft using your GPU.
#Exec=env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia $install_dir/minecraft-launcher/minecraft-launcher
Icon=$install_dir/minecraft-launcher.png
Terminal=false
Categories=Game;Application;
StartupWMClass=Minecraft Launcher
EOF

echo ".desktop file created at $desktop_file"

# Make the .desktop file executable
chmod +x "$desktop_file"

# Removing .tar.gz archive
echo "Removing $filename"
rm $filename
