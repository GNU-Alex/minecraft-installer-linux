# Minecraft Launcher Installation

This Bash script installs the official Minecraft launcher on Linux systems that are not based on Debian or Arch. It downloads the tar.gz file of the launcher, extracts it, moves the necessary files, and creates a `.desktop` file for easy launching of the game.

## Prerequisites

Before running this script, ensure you have the following:

- `wget`: to download the launcher file.
- `tar`: to extract the downloaded file.
- No root or sudo access is required, as the installation is done in your home directory.

## Installation

1. **Download the script**: Download the script on your desktop for exemple.

2. **Download the icon**: Download the icon at the same location as the script

3. **Make the script executable**:
   ```bash
   chmod +x minecraft-installer.sh
   ```

## Enjoy
After running the script, you should find Minecraft in your application menu.

## License

This script is provided as-is, without any warranty. Use it at your own risk.


## Notes

1. If you have a laptop with an Nvidia GPU, you can uncomment the corresponding line in the .desktop file to launch Minecraft using your GPU.
2. If you want to use the Minecraft icon from your icon theme, uncomment the corresponding line in the .desktop file.


   
