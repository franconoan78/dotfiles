#!/bin/bash

GIT=${pwd}
VIMSRC=${GIT}/vim
VIMRC=${HOME}.vimrc
echo $GIT2
$!
echo $1
$GIT
echo `$GIT`
pwd
echo -e $GIT
# check for old dotfiles and move them
if [ -d .dotfiles ]; then
        mv -fv ~/.dotfiles ~/.olddotfiles
        mkdir ~/.dotfiles
        mv -fv ~/.olddotfiles ~/.dotfiles
    else
        mkdir .dotfiles
    fi


if [ -f .vimrc ]; then
        mv -fv ~/.vimrc ~/.dotfiles/
        cp -fv ${GIT}vimrc ~/.vimrc
    else
        cp -fv ${GIT}vimrc ~/.vimrc
    fi



# vim:tw=88:ts=4:ft=sh:norl:
