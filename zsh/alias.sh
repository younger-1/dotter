# <https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions>

alias rm='rm -i'

# cat
alias b='bat'
alias ba='bat -A'
alias bd='bat -d'
alias cat="bat --style=plain --pager='less -RF'"

# ls
if alias ls &>/dev/null; then unalias ls; fi
if alias la &>/dev/null; then unalias la; fi
if alias l &>/dev/null; then unalias l; fi
if alias ll &>/dev/null; then unalias ll; fi

function ls { exa --icons --classify --group-directories-first $@; }
function la { ls -a $@; }
function lag { la --git-ignore $@; }
function l { ls -l --git $@; }
function l. { l -d .* $@; }
function lt { ls --tree $@; }
function llt { l --tree --no-permissions $@; }

function ll { l -a --header --time-style=long-iso $@; }
function lz { ll --sort=size $@; }
function lm { ll --modified --sort=modified $@; }
function lM { ll --changed  --sort=changed $@; }
function li { ll --accessed --sort=accessed $@; }
function lc { ll --created  --sort=created $@; }

# dirs
alias dir='dirs -v'
alias ...='../..'
alias cdroot='cd $(git rev-parse --show-toplevel)'

# vim
alias nvi='nvim --noplugin'
alias vi='vim --noplugin'
alias nvicat='nvim -u ~/dotter/pager.vim'
alias vicat='vim -u ~/dotter/pager.vim'

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
