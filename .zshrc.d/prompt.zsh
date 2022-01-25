setopt PROMPT_SUBST

# load git-prompt
git_promptpath=~/.zsh/git-prompt.sh
if [ -f ${git_promptpath} ]; then
  source ${git_promptpath}
  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWCOLORHINTS=true
  export GIT_PS1_SHOWUPSTREAM=auto
fi

if [ ${UID} -eq 0 ]; then
  PROMPT='
<%{$fg[red]%}%n@%{$fg[green]%}%m%{$reset_color%}> $(__git_ps1 "(%s)")
%{$fg[cyan]%}%~%{$reset_color%}# '
else
  PROMPT='
[%{$fg[red]%}%n@%{$fg[green]%}%m%{$reset_color%}] $(__git_ps1 "(%s)")
%{$fg[cyan]%}%~%{$reset_color%}$ '
fi
