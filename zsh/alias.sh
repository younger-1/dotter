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
# alias ls='ls --color=auto'
alias ls='exa'
alias l='exa -l'
alias la='exa -a'
alias ll='exa -la'
alias lt='exa --tree'
alias b='bat'
alias ba='bat -A'
alias bd='bat -d'
alias cat="bat --style=plain --pager='less -RF'"
alias dir='dirs -v'
alias nvi='nvim --noplugin'
alias vi='vim --noplugin'
alias nviat='nvim -u ~/dotter/pager.vim'
alias viat='vim -u ~/dotter/pager.vim'
alias ...='../..'
