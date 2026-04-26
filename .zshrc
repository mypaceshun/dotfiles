setopt nobeep
export EDITOR=vim
export VISUAL=vim

# color support
autoload -U colors; colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# load zsh_alias
ALIAS_FILE=~/.zsh_aliases
if [ -f ${ALIAS_FILE} ]; then
  source ${ALIAS_FILE}
fi
unset ALIAS_FILE

# add dir to PATH without duplicates
# usage: pathmarge <dir> [prepend]
function pathmarge() {
  local dir="$1"
  [[ ":$PATH:" == *":$dir:"* ]] && return
  if [[ "$2" == "prepend" ]]; then
    export PATH="$dir:$PATH"
  else
    export PATH="$PATH:$dir"
  fi
}

# load local bin
LOCAL_BIN_PATH=${HOME}/.local/bin
if [ -e ${LOCAL_BIN_PATH} ]; then
    pathmarge ${LOCAL_BIN_PATH}
fi
unset LOCAL_BIN_PATH

# load local settings
LOCAL_ZSHRC_PATH=~/.local_zshrc
if [ -e ${LOCAL_ZSHRC_PATH} ]; then
    source ${LOCAL_ZSHRC_PATH}
fi
unset LOCAL_ZSHRC_PATH

# load .zshrc.d
ZSHRC_D=~/.zshrc.d
if [ -d ${ZSHRC_D} ]; then
  for zshfile in ${ZSHRC_D}/*.zsh; do
    source ${zshfile}
  done
fi
unset ZSHRC_D
