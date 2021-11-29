#!/bin/bash

# echo "home bash profile"

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

source ~/.profile

function use_bash {
  source ~/zsh/oh-my-bash.sh

  [[ -f ~/.bashrc ]] && . ~/.bashrc

  source ~/zsh/common.sh
}

function use_zsh {
  if [[ -x "$(command -v zsh)" ]]; then
    exec zsh
  else
    echo "🤪: please install zsh."
  fi
}

function use_fish {
  if [[ -x "$(command -v fish)" ]]; then
    exec fish
  else
    echo "🤪: please install fish."
  fi
}

use_bash
