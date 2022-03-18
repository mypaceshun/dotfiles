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

function precmd () {
  FETCH_RUN=~/.fetch_run
  DELAY_TIME=10
  git rev-parse --git-dir >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    # git repositrory
    _GIT_REMOTE=`git remote`
    if [ "${_GIT_REMOTE}" != "" ]; then
      NOW_TIME=`date +%s`
      OLD_TIME=`cat ${FETCH_RUN} 2>/dev/null || echo ""`
      NEXT_TIME=$(( ${OLD_TIME} + ${DELAY_TIME} ))
      if [ ${NEXT_TIME} -lt ${NOW_TIME} ]; then
	date +%s > ${FETCH_RUN}
	git fetch >/dev/null 2>&1 &!
      fi
    fi
  fi
}
