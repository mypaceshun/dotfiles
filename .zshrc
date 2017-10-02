alias ll="ls -alh"
<<<<<<< HEAD
alias la="ls -a"
=======
alias la="ls -a" 
>>>>>>> d49f71960f921b225358ffb58e7c9bccfc079d2d

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

# load zsh_aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
