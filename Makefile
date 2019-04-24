all: zsh_plugins_and_themes spacevim

zsh_plugins_and_themes: config_copy
	git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
	ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    

config_copy: oh-my-zsh spacevim ./init.toml .zshrc
	cp .zshrc ~/.zshrc
	cp ./init.toml ~/.SpaceVim.d/init.toml
	cp .editorconfig ~/Documents/.editorconfig

spacevim: vim lua
	curl -sLf https://spacevim.org/install.sh | bash

lua: update
	pacman -S lua

vim: update
	pacman -S gvim

oh-my-zsh: zsh git
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

zsh: update
	pacman -S zsh

git: update
	pacman -S git

chrome: yay
	yay -S google-chrome

yay: update
	pacman -S yay

update:
	pacman -Syu
