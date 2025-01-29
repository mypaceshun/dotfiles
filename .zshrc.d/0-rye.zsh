# rye setting

RYE_HOME="${HOME}/.rye"

if [[ -f "${RYE_HOME}/env" ]]; then
    source "${RYE_HOME}/env"
fi
