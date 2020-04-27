#!/usr/bin/env bash

[[ $TERM != "screen" ]] && [[ $TERM != "dumb" ]] && exec tmux
