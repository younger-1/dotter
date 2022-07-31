# <https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions>

alias rm='rm -i'

# cat
alias b='bat'
alias ba='bat -A'
alias bd='bat -d'
if [[ -x "$(command -v bat)" ]]; then
  # alias cat="bat --style=plain --pager='less -RF'"
  alias cat="bat --style=plain --paging=never"
fi

# ls
if alias ls &>/dev/null; then unalias ls; fi
if alias la &>/dev/null; then unalias la; fi
if alias l &>/dev/null; then unalias l; fi
if alias ll &>/dev/null; then unalias ll; fi

if [[ -x "$(command -v exa)" ]]; then
  function ls { exa --icons --classify --group-directories-first "$@"; }
fi
function la { ls -a $@; }
function lag { la --git-ignore "$@"; }
function l { ls -l --git "$@"; }
function l. { l -d .* "$@"; }
function lt { ls --tree "$@"; }
function llt { l --tree --no-permissions "$@"; }

function ll { l -a --header --time-style=long-iso "$@"; }
function lz { ll --sort=size "$@"; }
function lm { ll --modified --sort=modified "$@"; }
function lM { ll --changed  --sort=changed "$@"; }
function li { ll --accessed --sort=accessed "$@"; }
function lc { ll --created  --sort=created "$@"; }

# dirs
alias dir='dirs -v'
alias ...='../..'
alias cdroot='cd $(git rev-parse --show-toplevel)'

# vim
alias vi='vim --clean'
alias nvi='nvim --clean'
alias nvi-norc='nvim -u NORC'
alias nvi-noplug='nvim --noplugin'

alias vcat='vim -u ~/dotter/pager.vim'
alias nvcat='nvim -u ~/dotter/pager.vim'

# dotfiles
# alias dot='/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
alias dot='git --git-dir=$HOME/dotter/.git --work-tree=$HOME/dotter'

# others
alias wan='w3mman'
alias untar='tar -xzvf'
# Color output
# https://wiki.archlinux.org/index.php/Color_output_in_console
#
# Prints all 256 colors across the screen:
# (x=`tput op` y=`printf %76s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done)
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

# https://askubuntu.com/questions/600018/how-to-display-path-as-one-directory-per-line
# echo $PATH | tr : '\n'
# echo -e "${PATH/:/\n}"
# tr ':' '\n' <<< "$PATH"
# sed 's/:/\n/g' <<< "$PATH"

if [[ $TERM =~ 'kitty' ]]; then
  alias icat="kitty +kitten icat"
  alias d="kitty +kitten diff"
fi
