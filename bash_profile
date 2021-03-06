#!/bin/bash

# echo "home bash profile"

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

source ~/.profile

function use_bash {
  # [[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

  source ~/zsh/oh-my-bash.sh
  # FIXME: oh-my-bash bind up/down
  bind -f ~/.inputrc

  [[ -f ~/.bashrc ]] && . ~/.bashrc

  source ~/zsh/common.sh

  # [[ ${BLE_VERSION-} ]] && ble-attach
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
