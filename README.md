# Minecraft Launcher Installation

This Bash script installs the official Minecraft launcher on Linux systems that are not based on Debian or Arch. It downloads the tar.gz file of the launcher, extracts it, moves the necessary files, and creates a `.desktop` file for easy launching of the game.

## Prerequisites

Before running this script, ensure you have the following:

- `wget`: to download the launcher file.
- `tar`: to extract the downloaded file.
- `curl`: to run the script on your PC
- No root or sudo access is required, as the installation is done in your home directory.

## Installation

1. **Run this script**:
   ```bash
   curl -sSL https://raw.githubusercontent.com/GNU-Alex/minecraft-installer-linux/main/minecraft-installer.sh | bash
   ```

## Enjoy
After running the script, you should find Minecraft in your application menu.

## License

This script is provided as-is, without any warranty. Use it at your own risk.


## Notes

1. If the game is not using your GPU, you can right click on the icon and select `Launch using Dedicated Graphics Card`.


   
