# poetry settings
type poetry >/dev/null 2>&1
if [ $? -eq 0 ]; then
    export POETRY_VIRTUALENVS_IN_PROJECT=true
fi
