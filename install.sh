#!/usr/bin/env bash

# install homebrew on mac

#̶ ̶i̶n̶s̶t̶a̶l̶l̶ ̶z̶s̶h̶
#̶ ̶l̶i̶n̶k̶ ̶c̶o̶n̶f̶i̶g̶

#̶ ̶i̶n̶s̶t̶a̶l̶l̶ ̶t̶m̶u̶x̶
#̶ ̶l̶i̶n̶k̶ ̶c̶o̶n̶f̶i̶g̶

#̶ ̶i̶n̶s̶t̶a̶l̶l̶ ̶n̶e̶o̶v̶i̶m̶
#̶ ̶l̶i̶n̶k̶ ̶n̶e̶o̶v̶i̶m̶/̶*̶ ̶t̶o̶ ̶~̶/̶

HERE=$(dirname $0)

if [[ "$OSTYPE" == "darwin"* ]]; then
	source install_functions_mac.sh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
	source install_functions_linux.sh
else
	echo "Unrecognised OS \"$OSTYPE\"!!"
	exit 1
fi

install_zsh
[[ ! -f ~/.zshenv ]] && ln -s $HERE/.zshenv ~/.zshenv # points zsh to config in this directory.

install_tmux
[[ ! -f ~/.tmux.conf ]] && ln -s $HERE/.tmux.conf ~/.tmux.conf

install_nvim
# [[ ! -f ~/.config/nvim ]] && ln -s $HERE/nvim ~/.config/nvim
[[ ! -d ~/.local/share/nvim/site/autoload ]] && mkdir -p '~/.local/share/nvim/site/autoload'
[[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]] && ln -s $HERE/neovim/vim-plug/plug.vim ~/.local/share/nvim/site/autoload/plug.vim

#install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim