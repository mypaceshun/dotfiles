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
:%{$fg[cyan]%}%~%{$reset_color%}
%{$fg[red]%}%n@%{$fg[green]%}%m%{$reset_color%}$"

# load zsh_aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
