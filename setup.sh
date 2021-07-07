#!/bin/zsh

DOT_FILES=(.bash* .vim* .zsh* .zpreztorc .gitconfig)

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

# install pure-prompt
# if type npm >/dev/null 2>&1; then
#   if !(npm list --global | grep pure-prompt>/dev/null 2>&1); then
#     mkdir -p /usr/local/share/zsh/site-functions \
#     && npm install --global pure-prompt
#   fi
# fi

# install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -vs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" || :
done
