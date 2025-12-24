setopt PROMPT_SUBST

# load git-prompt
git_promptpath=~/.zsh/git-prompt.sh
if [ -f ${git_promptpath} ]; then
  source ${git_promptpath}
  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWCOLORHINTS=true
  export GIT_PS1_SHOWUPSTREAM=auto
fi

function preexec() {
  CMD_START_TIME=$(date +%s.%N)
}

function precmd() {
  if [[ -n ${CMD_START_TIME} ]]; then
    local endtime=$(date +%s.%N)
    CMD_ELAPSED_TIME=$(printf "%.2f" "$(( endtime - CMD_START_TIME ))")
    unset CMD_START_TIME
  fi
}

if [ ${UID} -eq 0 ]; then
  PROMPT='
<%{$fg[red]%}%n@%{$fg[green]%}%m%{$reset_color%}> $(__git_ps1 "(%s)")
%{$fg[cyan]%}%1d%{$reset_color%}# '
else
  PROMPT='
[%{$fg[red]%}%n@%{$fg[green]%}%m%{$reset_color%}] $(__git_ps1 "(%s)")
%{$fg[cyan]%}%1d%{$reset_color%}$ '

fi
RPROMPT='${CMD_ELAPSED_TIME}s %{$fg[yellow]%}%D{%Y-%m-%d %H:%M:%S}%{$reset_color%}'
