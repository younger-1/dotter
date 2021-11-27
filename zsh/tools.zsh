local _config="$HOME/.config"
local _share="$HOME/.local/share"
local _bin="$HOME/.local/bin"

autoload compinit
compinit

# <https://hacdias.com/2021/05/30/cd-alias-completions-zsh>
function cdc() {
  cd "$_config/$1"
}

function _cdc() {
  ((CURRENT == 2)) &&
  _files -/ -W "$_config"
}

compdef _cdc cdc
