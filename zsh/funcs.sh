# File search functions
function f { find . -iname "*$1*" ${@:2}; }
function r { grep "$1" ${@:2} -R .; }

function md { mkdir -p "$@" && cd "$_"; }

function touchx { touch $1; chmod +x $1; }

function fdls { fd $@ -X exa -lhd; }

function today {
  date +"%A, %B %-d, %Y"
}

function what {
    bat $(whence $1)
}

# always change the dir 
function rar {
    ranger --choosedir=/tmp/rangerdir_cd $*
    LASTDIR=`cat /tmp/rangerdir_cd`
    if [[ $LASTDIR != $PWD ]]; then
        cd "$LASTDIR"
    fi
}

# changes the dir only when you quit ranger with keybinding capital Q
function ra {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# z.lua
if false && [[ -f /usr/share/z.lua/z.lua ]]; then
    eval "$(lua /usr/share/z.lua/z.lua --init ${ZSH_NAME:-bash} enhanced)"    # zsh/bash 初始化
    # export _ZL_MATCH_MODE=1
    export _ZL_HYPHEN=1
    export _ZL_ECHO=1
    alias zi='z -i'      # cd with interactive selection
    alias zz='z -I'      # use fzf to select in multiple matches
    alias zc='z -c'      # restrict matches to subdirs of $PWD
    alias zb='z -b'      # quickly cd to the parent directory
    alias zh='z -I -t .'
elif [[ -x "$(command -v zoxide)" ]]; then
    export _ZO_ECHO=1
    eval "$(zoxide init ${ZSH_NAME:-bash})"
    function zz {
        __zoxide_zi "$@"
    }
fi

# lazygit
# https://github.com/jesseduffield/lazygit#changing-directory-on-exit
function lg {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
    lazygit "$@"
    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
	cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
	rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

# rga
# https://github.com/phiresky/ripgrep-all
# Use rga interactively via fzf
function rga-fzf {
    RG_PREFIX="rga --files-with-matches"
    local file
    file="$(
	FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
	    fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
	    --phony -q "$1" \
	    --bind "change:reload:$RG_PREFIX {q}" \
	    --preview-window="70%:wrap"
    )" &&
    echo "opening $file" &&
    xdg-open "$file"
}

# navi
if [[ -x "$(command -v navi)" ]]; then
  eval "$(navi widget ${ZSH_NAME:-bash})"
fi

# broot
# <https://dystroy.org/broot/conf_verbs/>
# <https://dystroy.org/broot/tricks/>
# <https://dystroy.org/blog/gg/>
function br {                               
    local cmd cmd_file code                 
    cmd_file=$(mktemp)                      
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")                 
        rm -f "$cmd_file"                   
        eval "$cmd"                         
    else                                    
        code=$?                             
        rm -f "$cmd_file"                   
        return "$code"                      
    fi 
}
alias bs="br --conf ~/.config/broot/select.toml"
alias be="br --conf ~/.config/broot/edit.toml"

