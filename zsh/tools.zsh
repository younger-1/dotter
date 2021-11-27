local _config="$HOME/.config"
local _share="$HOME/.local/share"
local _bin="$HOME/.local/bin"

autoload compinit
compinit

# <https://hacdias.com/2021/05/30/cd-alias-completions-zsh>
# function cdc() {
#   cd "$_config/$1"
# }

# function _cdc() {
#   ((CURRENT == 2)) && _files -/ -W "$_config"
# }

typeset -A cd_aliases
cd_aliases=(
  [cdc]="$HOME/.config"
  [cds]="$HOME/.local/share"
  [cdu]="/usr/local"
)

for k in "${(@k)cd_aliases}"; do
  function $k() {
    cd "$cd_aliases[$0]/$1"
  }

  function _$k() {
    ((CURRENT == 2)) && _files -/ -W $cd_aliases[${0:1}]
  }

  compdef _$k $k
done
