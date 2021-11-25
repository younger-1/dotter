#!/bin/bash

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

function use_bash {
  source ~/.profile
  source ~/zsh/boot.sh

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
  source ~/.profile
  source ~/zsh/boot.sh

  if [[ -x "$(command -v fish)" ]]; then
    exec fish
  else
    echo "🤪: please install fish."
  fi
}

use_fish
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
