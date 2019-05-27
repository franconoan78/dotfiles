#!/bin/bash

BASH=~/.bashrc
BASH_ALIAS=~/.bash_aliases
BASHDIR=~/.bash

GIT=~/.config/git

VIMSRC=${GIT}/vim
VIMRC=${HOME}.vimrc

vim_INIT=init.vim
vim_AUTOCOMMAND=autocmd.vim
vim_HELPERS=helpers.vim
vim_OPTIONS=options.vim

export NVIM=/home/pi/.config/nvim

# check for old dotfiles and move them
function setup_vim(){
if [ -d ~/.config/nvim  ]; then
        sudo rm -R ~/.config/nvim 
fi

if [ -d /usr/share/nvim/runtime/autoload ]; then
		cp -v vim/autoload/plug.vim /usr/share/nvim/runtime/autoload/
fi

if [ ! -d nvim ]; then

		mkdir -v ~/.config/nvim/

fi

mkdir -v ~/.config/nvim/plugged/
mkdir -v ~/.config/nvim/vim_rc/
mkdir -v ~/.config/nvim/vim_rc/plug_in_rc/
     ln  vim/$vim_INIT   ~/.config/nvim/init.vim
     ln  vim/vim_rc/$vim_INIT ~/.config/nvim/vim_rc/$vim_INIT 
     ln  vim/vim_rc/$vim_AUTOCOMMAND   ~/.config/nvim/vim_rc/$vim_AUTOCOMMAND 
     ln  vim/vim_rc/$vim_HELPERS    ~/.config/nvim/vim_rc/$vim_HELPERS 
	 ln  vim/vim_rc/$vim_OPTIONS    ~/.config/nvim/vim_rc/$vim_OPTIONS 
	
    # ln  ~/git/dotfiles/vim/rc/  ~/.config/nvim/rc/ 
sudo cp vim/colorschems/*.vim /usr/share/nvim/runtime/colors/
}


function setup_bash(){
if [ -f BASH ];then
		echo "Remove Bashrc..."
		rm BASH
		echo "Installing Bashrc..."
		ln bash/bashrc BASH
fi

if [  -d $BASHDIR ]; then
		echo "Remove Bash..."
		rm $BASHDIR
		echo "Installing Bash..."
		mkdir $BASHDIR
		echo "Installing Aliases..."
		ln bash/$BASH_ALIAS $BASHDIR 
		ln bash/$BASH_ALIAS ~/

fi
}
setup_bash
setup_vim
# vim:tw=88:ts=4:ft=sh:norl:foldenable
