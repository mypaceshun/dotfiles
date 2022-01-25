# go settings
type go >/dev/null 2>&1
if [ $? -eq 0 ]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi
