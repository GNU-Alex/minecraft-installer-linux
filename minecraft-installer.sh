#!/bin/bash

filename="minecraft.tar.gz"
filename_icon="minecraft-launcher.png"
url="https://launcher.mojang.com/download/Minecraft.tar.gz"
launcher_icon_url="https://www.minecraft.net/etc.clientlibs/minecraft/clientlibs/main/resources/img/Launcher_Icon.png"
desktop_file="/usr/share/applications/minecraft-launcher.desktop"


echo "Downloading..."
# Getting Minecraft launcher from "Other" option on page minecraft.net/download
wget -q --show-progress -O $filename $url
echo "Download complete."


# Decompressing minecraft.tar.gz
echo "Decompressing $filename"
tar -xzvf $filename
echo "Decompressing done."

# Moving archive
echo "Moving archive..."
sudo mv minecraft-launcher/ /opt/
echo "Moving launcher Icon..."
sudo mv $filename_icon /opt/minecraft-launcher/ 
echo "Moving complete..."

# Creating .desktop file
echo "Creating .desktop file..."
sudo bash -c "cat > $desktop_file << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Minecraft Launcher
Comment=Official Minecraft Launcher
Exec=/opt/minecraft-launcher/minecraft-launcher
# If you have a laptop with Nvidia GPU, use this line for launching Minecraft using your GPU.
#Exec=env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia /opt/minecraft-launcher/minecraft-launcher
Icon=/opt/minecraft-launcher/minecraft-launcher.png
#Use this line for using the Minecraft icon from your Icons theme.
#Icon=minecraft
Terminal=false
Categories=Game;Application;
StartupWMClass=minecraft-launcher
EOF"

echo ".desktop file created at $desktop_file"

#Removing .tar.gz archive
echo "Removing $filename"
rm $filename



