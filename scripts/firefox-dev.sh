#!/bin/bash

SH_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SH_DIR}/../configs/paths.sh"
source "${Config_Path}/colors.sh"
source "${Config_Path}/general.sh"
source "${Config_Path}/functions.sh"

printf "${On_IPurple}-- FIREFOX DEV :: Start --${Color_Off}${br}";

Ffdev_File="$HOME/.local/share/applications/firefox_dev.desktop"
Ffdev_Folder="/opt/firefox_dev"
Ffdev_Temp="${Temp_Path}/ffdev"

createDir "$Ffdev_Temp"
cd "$Ffdev_Temp" || cd ~/ || exit

# Remove firefox developer previous version
printf "${BPurple}- Checking if folder exists${Color_Off}${br}";
if [ -d "$Ffdev_Folder" ]
then
  printf "${Purple}-- Removing folder${Color_Off}${br}";
  sudo rm -rf "$Ffdev_Folder"
else
  printf "${Purple}-- Folder do not exisits${Color_Off}${br}";
fi

printf "${BPurple}- Checking if launcher file exist${Color_Off}${br}";
if [ -f "$Ffdev_File" ]
then
  printf "${Purple}-- Removing launcher file${Color_Off}${br}";
  sudo rm "$Ffdev_File"
else
  printf "${Purple}-- Launcher file do not exist${Color_Off}${br}";
fi

# Download new version
printf "${BPurple}- Downloading firefox dev latest${Purple}${br}";
wget -O "$Ffdev_Temp/FirefoxSetupDev.tar.bz2" "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=pt-PT"

printf "${BPurple}- Installing${Color_Off}${br}";

# Extract folder
printf "${Purple}-- Extract:${br}";
tar -xvjf FirefoxSetupDev.tar.bz2

# Move to linux root aplications folder
printf "${Purple}-- Moving files${Color_Off}${br}";
sudo mv firefox firefox_dev
sudo mkdir /opt/firefox_dev
sudo mv firefox_dev/* /opt/firefox_dev

# Remove downloaded file
printf "${BPurple}- Removing downloaded file and folders${Color_Off}${br}";
rm FirefoxSetupDev.tar.bz2
rm -rf firefox_dev
rm -rf "$Ffdev_Temp"

# Create desktop launcher file
printf "${BPurple}- Create launcher file${Color_Off}${br}";
touch "$Ffdev_File"
cat <<EOF >> "$Ffdev_File"
[Desktop Entry]
Name=Firefox Developer
GenericName=Firefox Developer Edition
Exec=/opt/firefox_dev/firefox %u
Terminal=false
Icon=/opt/firefox_dev/browser/chrome/icons/default/default128.png
Type=Application
Categories=Application;Network;X-Developer;
Comment=Firefox Developer Edition Web Browser.
EOF

# Mark the launcher as trusted
printf "${Purple}-- Mark launcher as trusted${Color_Off}${br}";
chmod +x "$Ffdev_File"

# Exit script
printf "${On_IPurple}-- FIREFOX DEV :: Done --${Color_Off}${br}${br}${br}";
exit 0