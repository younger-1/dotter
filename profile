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

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

# For man to display colors
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# https://wiki.archlinux.org/index.php/Environment_variables
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
# export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'gedit'; else echo 'nano'; fi)"

# VISUAL contains command to run the full-fledged editor
export VISUAL='nvim'

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

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# julia
export JULIA_PKG_SERVER=https://mirrors.tuna.tsinghua.edu.cn/julia

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# ruby
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# rust
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup

# vim: shiftwidth=2
