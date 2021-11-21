#!/bin/bash

[[ -f ~/.profile ]] && . ~/.profile

if [[ -x "$(command -v fish)" ]]; then
    exec fish
fi
