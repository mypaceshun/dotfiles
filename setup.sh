#!/bin/bash

DOT_FILES=(.bash_profile .bash_aliases .bashrc .vimrc .vimperatorrc .tmux.conf .vimperator iMacros)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
