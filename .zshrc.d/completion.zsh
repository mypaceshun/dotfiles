autoload -Uz compinit && compinit

# load ~/.zsh/Completion
comppath=~/.zsh/Completion
if [ -d ${comppath} ]; then
  fpath=( ${comppath} $fpath)
fi
unset comppath

# load ~/.zsh/Completion/git-completion.bash
gitbash_comppath=~/.zsh/Completion/git-completion.bash
if [ -f ${bash_comppath} ]; then
  zstyle ':completion:*:*:git:*' script ${gitbash_comppath}
fi
unset gitbash_comppath

# load zsh-completions
zsh_comppath=`find ~/.zsh/Completion -type d -name "zsh-completion*" | head -n 1`
if [ -e ${zsh_comppath} ]; then
  if [ -d ${zsh_comppath}/src ]; then
    fpath=(${zsh_comppath}/src $fpath)
  fi
fi
