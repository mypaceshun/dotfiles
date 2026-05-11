# load ~/.zsh/Completion
comppath=~/.zsh/Completion
if [ -d ${comppath} ]; then
  fpath=( ${comppath} $fpath)
fi
unset comppath

# load ~/.zsh/Completion/git-completion.bash
gitbash_comppath=~/.zsh/Completion/git-completion.bash
if [ -f ${gitbash_comppath} ]; then
  zstyle ':completion:*:*:git:*' script ${gitbash_comppath}
fi
unset gitbash_comppath

# load zsh-completions (use glob instead of find)
zsh_comppath=(~/.zsh/Completion/zsh-completion*(N/[1]))
if [[ -n ${zsh_comppath} && -d ${zsh_comppath}/src ]]; then
  fpath=(${zsh_comppath}/src $fpath)
fi
unset zsh_comppath

# run compinit once per day, compile dump to .zwc for faster loading
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
  zcompile ~/.zcompdump
else
  compinit -C
fi
