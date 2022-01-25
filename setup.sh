#!/bin/bash

BASEDIR=`dirname $0`
DOT_FILES=(.bash* .vim* .zsh* .zpreztorc .gitconfig)

for file in ${DOT_FILES[@]}
do
    if [ -f $HOME/$file -a  ! -L $HOME/$file ]; then
# make backup directory
        if [ ! -e ${BASEDIR}/backup ]; then
            echo backup directory maked
            mkdir ${BASEDIR}/backup
        fi
        echo $file move backup directory becouse $file is exist
        mv -fv $HOME/$file ${BASEDIR}/backup/$file
    fi
    if [ ! -e $HOME/$file ]; then
        echo make symbolic link $file
        ln -sf ${BASEDIR}/$file $HOME/$file
    fi
done

# rewrite gitconfig
GITCONFIG=$HOME/.gitconfig
if [ -f $GITCONFIG ]; then
  grep -E "~/.gitconfig.local" $GITCONFIG
  if [ $? -eq 1 ]; then
    echo "rewrite $GITCONFIG"
    cat << EOF >>$GITCONFIG
[include]
	path = ~/.gitconfig.local
EOF
  fi
fi

# load setup.zsh for zsh
type zsh >/dev/null 2>&1
if [ $? -eq 0 ];then
  ZSH_SETUP=${BASEDIR}/setup.zsh
  if [ -e ${ZSH_SETUP} ]; then
    zsh ${ZSH_SETUP}
  fi
fi
