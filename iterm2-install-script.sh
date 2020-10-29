#! /bin/zsh

brew install cask
brew cask install google-chrome
brew cask install iterm2
brew install wget
brew cask install zsh
brew install htop
brew install tree
brew install nvm
brew cask install visual-studio-code
brew cask install postman

brew install zsh-completions

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

wget -O ~/Downloads/material-design-colors.itermcolors https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors

wget -O ~/Downloads/MesloLGMRegularforPowerline.ttf https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf?raw=true
cp ~/Downloads/MesloLGMRegularforPowerline.ttf ~/Library/Fonts/
rm -rf ~/Downloads/MesloLGMRegularforPowerline.ttf

# fonts installing
fonts=("Kanit" "Prompt" "Sarabun" "mitr")

for i in ${!fonts[@]};
do
	font=${fonts[$i]}
	wget -O ~/Downloads/${font}.zip http://fonts.google.com/download?family=${font}
	unzip -v ~/Downloads/${font}.zip
	cp ~/Downloads/${font}/*.ttf ~/Library/Fonts/
	rm -rf ~/Downloads/${font}
done

echo "
ZSH_DISABLE_COMPFIX=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=\"%f\"
# Visual customisation of the second prompt line
local user_symbol=\"$\"
if [[ $(print -P \"%#\") =~ "#" ]]; then
    user_symbol = \"#\"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=\"%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}\"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=’red’
" >> ~/.zshrc

sed "s/ZSH_THEME=\".*\"/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/g" ~/.zshrc > ~/tmp.zshrc && rm -rf ~/.zshrc && mv ~/tmp.zshrc ~/.zshrc

sed "s/plugins=(git)/plugins=(git zsh-autosuggestions)/g" ~/.zshrc > ~/tmp.zshrc && rm -rf ~/.zshrc && mv ~/tmp.zshrc ~/.zshrc
