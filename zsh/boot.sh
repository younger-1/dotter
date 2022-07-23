[ -s "$HOME/dotter/local/shell.sh" ] && source "$HOME/dotter/local/shell.sh"

# ssh
if [[ $use_ssh ]]; then
  if [[ -x "$(command -v keychain)" ]]; then
    # eval `keychain --eval --agents ssh id_rsa`
    eval $(keychain --eval --agents ssh --quick --quiet id_rsa --nogui)
  else
    echo "😅 keychain is missing.\n"
  fi
fi

if [[ $use_gpg ]] && [[ -x "$(command -v gpg)" ]]; then
  export GITHUB_AUTH_TOKEN=$(gpg --quiet -d $HOME/dotter/gpg/github.younger)
  export GITTY_TOKENS=github.com=$GITHUB_AUTH_TOKEN
fi

# Proxy
if [[ ! $use_proxy ]]; then
  return
fi

# export ClientIP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -f 1 -d '/')
export HostIP=$(cat /etc/resolv.conf | grep 'nameserver' | awk '{print $2}')
export HttpPort=7890
# export SocksPort=10808

showproxy() {
    echo ''
    echo "http_proxy=$http_proxy"
    echo "https_proxy=$https_proxy"
    # echo "ftp_proxy=$ftp_proxy"
    # echo "ALL_PROXY=$ALL_PROXY"
    echo ''
    echo "curl --connect-timeout 2 baidu.com"
    curl --connect-timeout 5 baidu.com
    echo ''
    echo "curl --connect-timeout 2 google.com"
    curl --connect-timeout 2 google.com
}

setproxy() {
    local ad="${1:-$HostIP:$HttpPort}"
    export http_proxy=http://$ad/
    export https_proxy=http://$ad/
    # export ftp_proxy=http://$ad/
    # export ALL_PROXY=socks5://$HostIP:$SocksPort/
}

unsetproxy() {
    unset https_proxy
    unset http_proxy
    # unset ftp_proxy
    # unset ALL_PROXY
}

# echo "=== Use proxy ==="
setproxy

setv2ray() {
    HttpPort=10809
    setproxy $HostIP:$HttpPort
    showproxy
}

setclash() {
    HttpPort=7890
    setproxy $HostIP:$HttpPort
    showproxy
}

setgithub() {
    setproxy 127.0.0.1:38457
    showproxy
}

