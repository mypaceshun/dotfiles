#!/bin/bash

DOT_FILES=(.bashrc .vimrc .vimperatorrc .tmux.conf .vimperator iMacros)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
