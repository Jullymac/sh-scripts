#!/bin/bash

SH_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SH_DIR}/../configs/paths.sh"
source "${Config_Path}/colors.sh"
source "${Config_Path}/general.sh"
source "${Config_Path}/functions.sh"

printf "${On_ICyan}-- TERMINAL :: Start --${Color_Off}${br}";

Terminal_Temp="${Temp_Path}/terminal"

createDir "$Terminal_Temp"
cd "$Terminal_Temp" || cd ~/ || exit

printf "${BCyan}- Install zsh${Color_Off}${br}";
sudo apt -y install zsh

printf "${BCyan}- Install powerline${Color_Off}${br}";
sudo apt-get -y install powerline fonts-powerline
mkdir -p ~/.local/share/fonts/
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O ~/.local/share/fonts/PowerlineSymbols.otf
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O ~/.config/fontconfig/conf.d/10-powerline-symbols.conf

printf "${BCyan}- Clone the Oh My Zsh Respo${Color_Off}${br}";
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

printf "${BCyan}- Create a New ZSH configuration file${Color_Off}${br}";
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

printf "${BCyan}- Install powerlevel9k theme${Color_Off}${br}";

printf "${Cyan}-- Clone repo${Color_Off}${br}";
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

printf "${Cyan}-- Set up theme${Color_Off}${br}";
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel9k\/powerlevel9k"/g' ~/.zshrc

printf "${BCyan}-- Install nerd font${Color_Off}${br}";
cd ~/.local/share/fonts 
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fc-cache -vf ~/.local/share/fonts/

printf "${BCyan}-- Install Awesome-Terminal Fonts${Color_Off}${br}";
cd ~/.local/share/fonts 
curl -fLo "devicons-regular.ttf" https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/devicons-regular.ttf
curl -fLo "devicons-regular.sh" https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/devicons-regular.sh
curl -fLo "fontawesome-regular.ttf" https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/fontawesome-regular.ttf
curl -fLo "fontawesome-regular.sh" https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/fontawesome-regular.sh
curl -fLo "octicons-regular.ttf" https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/octicons-regular.ttf
curl -fLo "octicons-regular.sh" https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/octicons-regular.sh
curl -fLo "pomicons-regular.ttf" https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/pomicons-regular.ttf
curl -fLo "pomicons-regular.sh" https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/pomicons-regular.sh
fc-cache -vf ~/.local/share/fonts/
curl -fLo "10-symbols.conf" https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/config/10-symbols.conf
sed -i 's/<family>PragmataPro<\/family>/<family>Droid Sans Mono for Powerline Nerd Font Complete<\/family>/g' 10-symbols.conf
mv 10-symbols.conf ~/.config/fontconfig/conf.d/10-symbols.conf
echo "source ~/.local/share/fonts/devicons-regular.sh" >> "$HOME/.zshrc"
echo "source ~/.local/share/fonts/fontawesome-regular.sh" >> "$HOME/.zshrc"
echo "source ~/.local/share/fonts/octicons-regular.sh" >> "$HOME/.zshrc"
echo "source ~/.local/share/fonts/pomicons-regular.sh" >> "$HOME/.zshrc"

printf "${Cyan}-- Powerlevel9 configs${Color_Off}${br}";
echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)" >> "$HOME/.zshrc"
echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)" >> "$HOME/.zshrc"
echo "POWERLEVEL9K_CONTEXT_TEMPLATE=''" >> "$HOME/.zshrc"
echo "POWERLEVEL9K_MODE='awesome-fontconfig'" >> "$HOME/.zshrc"

cd ~/

printf "${BCyan}- Change Default Shell${Color_Off}${br}";
chsh -s /bin/zsh

# Revert Back to Default Shell
# chsh -s /bin/bash

#printf "${BCyan}- Adding alias${Color_Off}${br}";
#echo "alias st='/usr/bin/sublime-text'" >> "$HOME/.zshrc"

printf "${BCyan}- Install ZSH Syntax Highlighting for Oh My Zsh${Color_Off}${br}";

printf "${Cyan}-- Clone the ZSH Syntax Highlighting${Color_Off}${br}";
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1

printf "${Cyan}-- Add syntax-highlighting to Configuration${Color_Off}${br}";
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

#printf "${BCyan}- Install hyper.js${Color_Off}${br}";
#printf "${Cyan}-- Downloading latest${Cyan}${br}";
#wget -O "$Terminal_Temp/hyper.deb" "https://releases.hyper.is/download/deb"

#printf "${Cyan}-- Installing${Color_Off}${br}";
#sudo dpkg -i "$Terminal_Temp/hyper.deb"

#printf "${Cyan}-- Fix Hyper first line precent sign${Color_Off}${br}";
#echo "unsetopt PROMPT_SP" >> "$HOME/.zshrc"

printf "${BCyan}- Removing temp folder${Color_Off}${br}";
rm -rf "$Terminal_Temp"

# Exit script
printf "${On_ICyan}-- TERMINAL :: Done --${Color_Off}${br}${br}${br}";
exit 0

