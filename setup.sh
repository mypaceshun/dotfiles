#!/bin/bash

DOT_FILES=(.bash* .vim* .zsh* .gitconfig)

for file in ${DOT_FILES[@]}
do
    if [ -f $HOME/$file -a  ! -L $HOME/$file ]; then
# make backup directory
        if [ ! -e $HOME/dotfiles/backup ]; then
            echo backup directory maked
            mkdir $HOME/dotfiles/backup
        fi
        echo $file move backup directory becouse $file is exist
        mv -fv $HOME/$file $HOME/dotfiles/backup/$file
    fi
    if [ ! -e $HOME/$file ]; then
        echo make symbolic link $file
        ln -sf $HOME/dotfiles/$file $HOME/$file
    fi
done
