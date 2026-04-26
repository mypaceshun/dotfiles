# pyenv settings
if [ -e "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    pathmarge "$PYENV_ROOT/bin" prepend
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
fi
