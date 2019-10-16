#!/bin/bash

SH_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SH_DIR}/../configs/paths.sh"
source "${Config_Path}/colors.sh"
source "${Config_Path}/general.sh"


printf "${On_IBlue}-- DEVELOPER TOOLS :: Start --${Color_Off}${br}";

printf "${BBlue}- Install Git${Color_Off}${br}";
sudo apt -y install git-all

printf "${BBlue}- Install Curl${Color_Off}${br}";
sudo apt-get -y install curl

printf "${BBlue}- Install NodeJs with nvm-sh${Color_Off}${br}";
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts


# Exit script
printf "${On_IBlue}-- DEVELOPER TOOLS :: Done --${Color_Off}${br}${br}${br}";
exit 0

