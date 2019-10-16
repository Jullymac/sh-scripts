#!/bin/bash

source configs/paths.sh
source configs/colors.sh
source configs/general.sh

printf "${On_IBlack}-- INSTALATIONS :: Start --${Color_Off}${br}";

printf "${BBlack}- Create temp path${Color_Off}${br}";
mkdir "$Temp_Path"

printf "${BBlack}- Update the packages${Color_Off}${br}";
sudo apt-get update
sudo apt upgrade

printf "${BBlack}- Set permissions to scripts${Color_Off}${br}";
chmod +x scripts/developer.sh
chmod +x scripts/firefox-dev.sh
chmod +x scripts/terminal.sh

printf "${BBlack}- Execute scripts scripts${Color_Off}${br}";
./scripts/developer.sh
./scripts/terminal.sh
./scripts/firefox-dev.sh



printf "${BBlack}- Removing temp folder${Color_Off}${br}";
rm -rf "$Temp_Path"

printf "${On_IBlack}-- INSTALATIONS :: Done --${Color_Off}${br}${br}${br}";

printf "${On_IRed}                                   ${Color_Off}${br}";
printf "${On_IRed}   !! DON'T FORGET TO RESTART !!   ${Color_Off}${br}";
printf "${On_IRed}                                   ${Color_Off}${br}${br}${br}";