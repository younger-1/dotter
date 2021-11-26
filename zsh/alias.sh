# <https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions>

# cat
alias b='bat'
alias ba='bat -A'
alias bd='bat -d'
alias cat="bat --style=plain --pager='less -RF'"

# ls
if alias la &>/dev/null; then unalias la; fi

function ls { exa --icons $@; }
function la { ls -a $@; }
function lag { ls -a --git-ignore $@; }
function ll { ls -l --git $@; }
function lla { la -l --git $@; }
function lt { ls --tree $@; }
function llt { ll --tree $@; }

function l { lla --header $@; }
function lz { l --sort=size $@; }
function lm { l --modified --sort=modified $@; }
function lM { l --changed  --sort=changed $@; }
function li { l --accessed --sort=accessed $@; }
function lc { l --created  --sort=created $@; }


# function l { lsd -l $args }

# dirs
alias dir='dirs -v'
alias ...='../..'

# vim
alias nvi='nvim --noplugin'
alias vi='vim --noplugin'
alias nviat='nvim -u ~/dotter/pager.vim'
alias viat='vim -u ~/dotter/pager.vim'

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
