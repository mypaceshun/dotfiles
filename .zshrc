alias ll="ls -alh"
alias la="ls -a"

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

autoload colors
colors

autoload -U promptinit; promptinit
if (prompt -l | grep "pure ") >/dev/null 2>&1; then
    prompt pure
else
    if [ $USER = "root" ]; then
        PROMPT="
<%{$fg[red]%}%n@%{$fg[green]%}%m%{$reset_color%}>
%{$fg[cyan]%}%~%{$reset_color%}$ "
    else
        PROMPT="
[%{$fg[red]%}%n@%{$fg[green]%}%m%{$reset_color%}]
%{$fg[cyan]%}%~%{$reset_color%}$ "
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# load zsh_aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# load command completion
fpath=(~/dotfiles/zsh-completions/src $fpath)
fpath=(~/dotfiles/zsh-virsh-autocomplete $fpath)
autoload -U compinit; compinit

# load command_not_found_handler
. ~/.zsh_command_not_found

LOCAL_ZSHRC_PATH=~/.local_zshrc
# load local settings
if [ -e ${LOCAL_ZSHRC_PATH} ]; then
    . ${LOCAL_ZSHRC_PATH}
fi
unset LOCAL_ZSHRC_PATH

# pipenv settings
type pipenv >/dev/null 2>&1
if [ $? -eq 0 ]; then
    export PIPENV_VENV_IN_PROJECT=1
    fpath=(~/dotfiles/zsh-pipenv-completion $fpath)
fi

# pyenv settings
if [ -e "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# go settings
type go >/dev/null 2>&1
if [ $? -eq 0 ]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi
