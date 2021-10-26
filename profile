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

# Proxy
export ClientIP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -f 1 -d '/')
export HostIP=$(cat /etc/resolv.conf | grep 'nameserver' | awk '{print $2}')
export HttpPort=10809
export SocksPort=10808

showproxy() {
    echo ''
    echo 'Show Proxy:'
    echo "http_proxy=$http_proxy"
    echo "https_proxy=$https_proxy"
    echo "ftp_proxy=$ftp_proxy"
    echo "ALL_PROXY=$ALL_PROXY"
    echo ''
    echo "curl --connect-timeout 2 baidu.com"
    curl --connect-timeout 5 baidu.com
    echo ''
    echo "curl --connect-timeout 2 google.com"
    curl --connect-timeout 2 google.com
}

setproxy() {
    export http_proxy=http://$HostIP:$HttpPort/
    export https_proxy=http://$HostIP:$HttpPort/
    export ftp_proxy=http://$HostIP:$HttpPort/
    export ALL_PROXY=socks5://$HostIP:$SocksPort/
}

unsetproxy() {
    unset https_proxy
    unset http_proxy
    unset ftp_proxy
    unset ALL_PROXY
}

setproxy

# To use different colors for different file extensions
# <https://www.topbug.net/blog/2016/11/28/a-better-ls-command/#better-color>
# <https://github.com/sharkdp/vivid>
if [[ -x "$(command -v vivid)" ]]; then
    export LS_COLORS="$(vivid generate molokai)"
    function setcolor() {
        export LS_COLORS="$(vivid generate $1)"
    }
else
    eval "$(dircolors)"
fi

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '
# export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
# export LESSHISTFILE="$XDG_CACHE_HOME/less_history"

# For man to display colors
# export MANPATH="/usr/local/man:$MANPATH"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Terminal Test
# [ANSI escape code](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors)
# echo -e "\e[1mbold\e[0m"
# echo -e "\e[3mitalic\e[0m"
# echo -e "\e[4munderline\e[0m"
# echo -e "\e[9mstrikethrough\e[0m"
# echo -e "\e[31mHello World\e[0m"

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
    export BROWSER=links
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# for VcXsrv to display
# export DISPLAY=:0.0
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# export LIBGL_ALWAYS_INDIRECT=1

# for PulseAudio
export PULSE_SERVER=tcp:localhost

# [rg](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file)
export RIPGREP_CONFIG_PATH=$HOME/dotter/rgrc

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
export PATH="$HOME/.cargo/bin:$PATH"
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup

# ruby
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# go
export PATH="$HOME/go/bin:$PATH"

# lvim
export LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-$HOME/.local/share/lunarvim}"
export LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-$HOME/.config/lvim}"

# vim: shiftwidth=4 ft=sh
