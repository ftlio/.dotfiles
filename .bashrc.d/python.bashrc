#!/usr/bin/env bash

# Do stupid stuff because MacOS is stupid
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
