#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function use_bash {
  [[ -f ~/.profile ]] && . ~/.profile

  [[ -f ~/.bashrc ]] && . ~/.bashrc
}

function use_zsh {
  if [[ -x "$(command -v zsh)" ]]; then
    exec zsh
  else
    echo "🤪: please install zsh."
  fi
}

function use_fish {
  [[ -f ~/.profile ]] && . ~/.profile

  if [[ -x "$(command -v fish)" ]]; then
    exec fish
  else
    echo "🤪: please install fish."
  fi
}

use_fish
