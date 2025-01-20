BASEDIR=$(cd $(dirname $0); pwd)
COMPDIR=~/.zsh/Completion

# download zsh-completions
ZSH_COMPLETIONS_TAG=0.35.0
if [ ! -e ${COMPDIR}/zsh-completions-${ZSH_COMPLETIONS_TAG} ]; then
  curl -L https://github.com/zsh-users/zsh-completions/archive/refs/tags/${ZSH_COMPLETIONS_TAG}.tar.gz -o ${BASEDIR}/zsh-completions.tar.gz
  tar xf ${BASEDIR}/zsh-completions.tar.gz -C ${COMPDIR}
  rm ${BASEDIR}/zsh-completions.tar.gz
fi
