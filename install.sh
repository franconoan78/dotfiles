#!/bin/bash

GIT=${pwd}
VIMSRC=${GIT}/vim
VIMRC=${HOME}.vimrc
BASH=~/.bashrc
BASHALIAS=~/.bash_aliases
BASHDIR=~/.bash

export NVIM=/home/pi/.config/nvim


echo $GIT2
$!
echo $1
$GIT
echo `$GIT`
pwd
echo -e $GIT
# check for old dotfiles and move them
function setup_vim(){
if [ -d ~/.config/nvim  ]; then
        rm -R ~/.config/nvim 
fi

mkdir ~/.config/nvim/plugged 
mkdir ~/.config/nvim/vim_rc
mkdir ~/.config/nvim/rc/plug_in_rc
     ln  vim/init.vim   ~/.config/nvim/init.vim
     ln  vim/rc/init.vim ~/.config/nvim/rc/init.vim 
     ln  vim/rc/autocmd.vim   ~/.config/nvim/rc/autocmd.vim
     ln  vim/rc/helpers.vim   ~/.config/nvim/rc/helpers.vim
	 ln  vim/rc/options.vim   ~/.config/nvim/rc/options.vim
	
    # ln  ~/git/dotfiles/vim/rc/  ~/.config/nvim/rc/ 
sudo cp vim/colorschems/*.vim /usr/share/nvim/runtime/colors/
}


function setup_bash(){
if [ -f ~/.bashrc ];then
		echo "Remove Bashrc..."
		rm ~/.bashrc
		echo "Installing Bashrc..."
		ln bash/bashrc ~/.bashrc
fi

if [  -d $BASHDIR ]; then
		echo "Remove Bash..."
		rm $BASHDIR
		echo "Installing Bash..."
		mkdir $BASHDIR
		echo "Installing Aliases..."
		ln bash/.bash_aliases $BASHDIR 
		ln bash/.bash_logout ~/

fi
}

# vim:tw=88:ts=4:ft=sh:norl:foldenable
