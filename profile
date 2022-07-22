#!/bin/bash

# echo "home profile"

# The purpose of the "profile" files is to
# contain commands that ought only run once, only at the beginning of login

########################### System ##########################

source ~/zsh/boot.sh

# Set XDG dirs
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_RUNTIME_DIR=~/.xdg

if [[ "$OSTYPE" == darwin* ]]; then
  export XDG_DESKTOP_DIR=~/Desktop
  export XDG_DOCUMENTS_DIR=~/Documents
  export XDG_DOWNLOAD_DIR=~/Downloads
  export XDG_MUSIC_DIR=~/Music
  export XDG_PICTURES_DIR=~/Pictures
  export XDG_VIDEOS_DIR=~/Videos
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# for VcXsrv to display
# export DISPLAY=:0.0
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# export LIBGL_ALWAYS_INDIRECT=1

# Terminal Test
# [ANSI escape code](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors)
# echo -e "\e[1mbold\e[0m"
# echo -e "\e[3mitalic\e[0m"
# echo -e "\e[4munderline\e[0m"
# echo -e "\e[9mstrikethrough\e[0m"
# echo -e "\e[31mHello World\e[0m"


########################### APP ##########################

# https://wiki.archlinux.org/index.php/Environment_variables
# Preferred editor for local and remote sessions
if [[ -x "$(command -v lvim)" ]]; then
    export EDITOR='lvim'
    export VISUAL='lvim'
    export GIT_EDITOR='lvim'
elif [[ -x "$(command -v nvim)" ]]; then
    export EDITOR='nvim'
    export VISUAL='nvim'
    export GIT_EDITOR='nvim'
elif [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
elif [[ -x "$(command -v vim)" ]]; then
    export EDITOR='vim'
    export VISUAL='vim'
fi
# export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'gedit'; else echo 'nano'; fi)"

# BROWSER contains the path to the web browser
if [ -n "$DISPLAY" ]; then
    export BROWSER=firefox
else
    if [[ -x "$(command -v links)" ]]; then
        export BROWSER=links
    elif [[ -x "$(command -v w3m)" ]]; then
        export BROWSER=links
    fi
fi

# For emacs-28 enable true color in TUI
export COLORTERM=truecolor

# To use different colors for different file extensions
# <https://www.topbug.net/blog/2016/11/28/a-better-ls-command/#better-color>
# <https://github.com/sharkdp/vivid>
if [[ -x "$(command -v vivid)" ]]; then
    export LS_COLORS="$(vivid generate molokai)"
    function setcolor() {
        export LS_COLORS="$(vivid generate $1)"
    }
fi

if [[ -x "$(command -v dircolors)" ]]; then
    eval "$(dircolors)"
fi

# /home/linuxbrew/.linuxbrew/Cellar/source-highlight/3.1.9_5/bin/source-highlight-esc.sh
# export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R '
# export LESSHISTFILE="$XDG_CACHE_HOME/less_history"

export PAGER='less -RF'
if [[ -x "$(command -v bat)" ]]; then
  export PAGER='bat --style=plain --paging=auto'
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# For man to display colors
# export MANPATH="/usr/local/man:$MANPATH"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# for PulseAudio
export PULSE_SERVER=tcp:localhost

# <https://unix.stackexchange.com/questions/608842/zshrc-export-gpg-tty-tty-says-not-a-tty>
# export GPG_TTY=$(tty)
export GPG_TTY=$TTY

# export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"


########################### PATH ##########################

export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# volta
# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"

# pnpm
export PATH="$HOME/pnpm-bin:$PATH"

# julia
export JULIA_PKG_SERVER=https://mirrors.tuna.tsinghua.edu.cn/julia

# cargo & rust
# case ":${PATH}:" in
#     *:"$HOME/.cargo/bin":*)
#         ;;
#     *)
#         # Prepending path in case a system-installed rustc needs to be overridden
#         export PATH="$HOME/.cargo/bin:$PATH"
#         ;;
# esac

export PATH="$HOME/.cargo/bin:$PATH"
# export RUSTUP_DIST_SERVER=http://mirrors.rustcc.cn
# export RUSTUP_UPDATE_ROOT=http://mirrors.rustcc.cn/rustup
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# ruby
# export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# go
export PATH="$HOME/go/bin:$PATH"

# lvim
export LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-$HOME/.local/share/lunarvim}"
export LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-$HOME/.config/lvim}"

# [rg](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file)
export RIPGREP_CONFIG_PATH=$HOME/dotter/rgrc

# PYTHONSTARTUP
export PYTHONSTARTUP=~/dotter/python_startup.py

# [webinstall.dev]: envman
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# [brew]:
# <https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/>
# <https://docs.brew.sh/Homebrew-on-Linux>
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

# vim: shiftwidth=4 ft=sh
