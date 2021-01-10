#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    source "$HOME/.bashrc"
fi

[[ -s "/Users/alen/.gvm/scripts/gvm" ]] && source "/Users/alen/.gvm/scripts/gvm"
