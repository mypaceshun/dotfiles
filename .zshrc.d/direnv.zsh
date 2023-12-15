# direnv settings
#
# direnv install
# > go install github.com/direnv/direnv@latest
type direnv >/dev/null 2>&1
if [ $? -eq 0 ]; then
  eval "$(direnv hook zsh)"
fi
