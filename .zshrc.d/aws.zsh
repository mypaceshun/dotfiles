# aws settings
type aws_completer >/dev/null 2>&1
if [ $? -eq 0 ]; then
    autoload bashcompinit && bashcompinit
    complete -C 'aws_completer' aws
fi
