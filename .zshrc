alias ll="ls -alh"
alias la="ls -a"

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

autoload colors
colors
PROMPT="
[%{$fg[red]%}%n@%{$fg[green]%}%m%{$reset_color%}]
%{$fg[cyan]%}%~%{$reset_color%}$"

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
