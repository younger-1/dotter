$mytool = $PSCommandPath

function suu { scoop update; scoop update * }

# Set-Alias ls lsd -Option "AllScope"
function l { lsd -l $args }
function la { lsd -A $args }
function ll { lsd -lA $args }
function lt { lsd --tree $args }

# Set-Alias cat bat -Option "AllScope"
function b { bat $args }
function ba { bat -A $args }
function bd { bat -d $args }

function visualCode {
    $installPath = &"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -version 16.0 -property installationpath
    Import-Module (Join-Path $installPath "Common7\Tools\Microsoft.VisualStudio.DevShell.dll")
    $null = Enter-VsDevShell -VsInstallPath $installPath -SkipAutomaticLocation
    #Enter-VsDevShell -VsInstallPath $installPath -SkipAutomaticLocation
    code -n .
}

function visual {
    $installPath = &"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -version 16.0 -property installationpath
    Import-Module (Join-Path $installPath "Common7\Tools\Microsoft.VisualStudio.DevShell.dll")
    Enter-VsDevShell -VsInstallPath $installPath -SkipAutomaticLocation
}

function condaIt { powershell.exe -ExecutionPolicy ByPass -NoExit -Command "& 'C:\Users\younger\AppData\Local\Continuum\anaconda3\shell\condabin\conda-hook.ps1' ; conda activate 'C:\Users\younger\AppData\Local\Continuum\anaconda3' " }
function condaCmd { cmd.exe /K %LocalAppData%/Continuum/Anaconda3/Scripts/activate.bat %LocalAppData%/Continuum/Anaconda3 }

function ipy {
    conda activate
    ipython.exe
    conda deactivate
}

function jsh {
    $env:java_tool_options = '-Dfile.encoding=utf-8'
    $env:JSHELLEDITOR = 'code'
    jshell.exe $args
    $env:java_tool_options = ''
    $env:JSHELLEDITOR = ''
}

function vi {
    vim --clean $args
}

function nvi {
    nvim --clean $args
}

function nvi-norc {
    nvim -u NORC $args
}

function nvi-noplug {
    nvim --noplugin $args
}

# SpaceVim
function svi($path) {
    # Don't use following:
    # $env:XDG_CONFIG_HOME = "$HOME/.cache"
    # $env:XDG_CONFIG_HOME = "$HOME/.SpaceVim.d"
    # Put nvim symlink under it:
    $env:XDG_CONFIG_HOME = "$HOME/blogs"
    nvim $path
    $env:XDG_CONFIG_HOME = ""
}

function vcat {
    vim -u $HOME/dotter/pager.vim $args
}

function nvcat {
    nvim -u $HOME/dotter/pager.vim $args
}

# Change working dir in powershell to last dir in lf on exit.
function lf() {
    $tmp = [System.IO.Path]::GetTempFileName()
    lf.ps1 -last-dir-path="$tmp" $argument
    if (test-path -pathtype leaf "$tmp") {
        $dir = Get-Content "$tmp"
        remove-item -force "$tmp"
        if (test-path -pathtype container "$dir") {
            if ("$dir" -ne "$pwd") {
                cd "$dir"
            }
        }
    }
}

function br() {
    # $tmp = new-temporaryfile
    $tmp = [System.IO.Path]::GetTempFileName()
    # echo $tmp
    # broot --outcmd "$cmd_file" "$@"
    broot.ps1 --outcmd "$tmp" $args
    if (test-path -pathtype leaf "$tmp") {
        $cmd = Get-Content "$tmp"
        try { iex $cmd } catch { "" }
        remove-item -force "$tmp"
    }
}

# Note: git is func and git.exe/ps1 is the exectable
# This can omit: $git_init = $false
function git {
    if ($global:git_init) {
        git.exe $args
    }
    else {
        Import-Module posh-git
        $global:git_init = $true
        git.exe $args
    }
}

function gitcm($scope) {
    if (($args).count -gt 0) {
      $git_msg = "[{0}]: {1}" -f $scope, ($args -join ' ')
    } else {
      $git_msg = $scope
    }
    # echo $git_msg
    git c -m $git_msg
}


# [dotfiles]
# https://www.atlassian.com/git/tutorials/dotfiles
# function dot {
#     # git --git-dir=$HOME/dotfiles.git --work-tree=$HOME $args
#     git --git-dir=$HOME/dotfiles.git --work-tree=$HOME @args
# }

function dot {
    # git --git-dir=$HOME/dotfiles.git --work-tree=$HOME $args
    git --git-dir=$HOME/dotter/.git --work-tree=$HOME/dotter @args
}

# PSFzf
if (Get-Command Set-PsFzfOption -errorAction SilentlyContinue) {
    Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
    # Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'
    # Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
}



<############### Start of PowerTab Initialization Code ########################
    Added to profile by PowerTab setup for loading of custom tab expansion.
    Import other modules after this, they may contain PowerTab integration.
#>

# Import-Module "PowerTab" -ArgumentList "C:\Users\didi\AppData\Roaming\PowerTab\PowerTabConfig.xml"
################ End of PowerTab Initialization Code ##########################


# fzf
# $env:FZF_DEFAULT_COMMAND = 'procs.exe --color=always'
# $env:FZF_DEFAULT_COMMAND = 'rg --hidden --no-ignore --files'
# $env:FZF_DEFAULT_COMMAND = 'fd --color=always --hidden --exclude .git'

# $env:FZF_DEFAULT_OPTS = '--layout=reverse --border'
# $env:FZF_DEFAULT_OPTS = "--ansi --multi --cycle `
#         --height 110 --layout=reverse --border=sharp `
#         --bind='ctrl-a:toggle-all' `
#         --bind='ctrl-l:clear-screen' `
#         --bind='ctrl-d:half-page-down' `
#         --bind='ctrl-u:half-page-up' `
#         --bind='ctrl-f:page-down' `
#         --bind='ctrl-b:page-up' "

# $env:FZF_CTRL_T_COMMAND = $env:FZF_DEFAULT_COMMAND
# $env:FZF_CTRL_T_COMMAND = "cmd /c dir /s/b/a:-d-h"
# $env:FZF_CTRL_T_OPTS = "--ansi --layout=reverse --border=sharp --prompt='>>> ' --marker='| ' -m  --header='Younger Searching' --color=16 --preview='bat --color=always --number {}' --preview-window=right:sharp --bind 'ctrl-y:execute-silent(bat {} | clip)+abort'"

<# Usage:
    1. vim (f)
    2. bat (f)
    3. (f) | bat
    4. f (ss prefix trojan-go)
    5. vim (f (ss prefix trojan-go))
#>
function f {
    # fd [FLAGS/OPTIONS] [<pattern>] [<path>...]
    $files = fd --color=always --type f --hidden --no-ignore --exclude .git . $args | `
        fzf --ansi --multi --cycle `
        --height=110 --layout=reverse --border=sharp `
        --prompt='>>> ' --marker='| ' --info='inline' `
        --header='Younger Searching' `
        --preview='bat --color=always --number {}' `
        --preview-window=right:sharp `
        --bind 'ctrl-y:execute-silent(bat {} | clip)+abort' `
        --bind='ctrl-a:toggle-all' `
        --bind='ctrl-p:toggle-preview' `
        --bind='ctrl-l:clear-screen' `
        --bind='ctrl-d:preview-half-page-down' `
        --bind='ctrl-u:preview-half-page-up' `
        --bind='ctrl-f:page-down' `
        --bind='ctrl-b:page-up' `
        # --color='fg:#af5fff,bg:#121212,hl:#f74204' `
        # --color='info:#cf5300,prompt:#ff0511,pointer:#afd7ff' `
    # --color='fg+:#85e63a,bg+:#262626,hl+:#ae11d1' `
    # --color='marker:#14f73e,spinner:#2c81d1,header:#00ffff' `
    # --color='preview-fg:#d426cb,border:#bb9167' `
    # --color='preview-bg:#0e001f' `

    $files
    # [Microsoft.PowerShell.PSConsoleReadLine]::Insert($files)
}
function d {
    fd --color=always --type d --hidden --no-ignore --exclude .git . $args | `
        fzf --ansi --color=16 --multi --cycle `
        --height=110 --layout=reverse --border=sharp `
        --prompt='>>> ' --marker='| ' --info='inline' `
        --header='Younger Searching' `
        --preview='lsd -l --color=always --icon=always --blocks=permission,inode,size,date,name {}' `
        --preview-window=right:sharp `
        --bind 'ctrl-y:execute-silent(bat {} | clip)+abort' `
        --bind='ctrl-a:toggle-all' `
        --bind='ctrl-p:toggle-preview' `
        --bind='ctrl-l:clear-screen' `
        --bind='ctrl-d:preview-half-page-down' `
        --bind='ctrl-u:preview-half-page-up' `
        --bind='ctrl-f:page-down' `
        --bind='ctrl-b:page-up' `

}
function df {
    fd --color=always --hidden --no-ignore --exclude .git . $args | `
        fzf --ansi --color=16 --multi --cycle `
        --height=110 --layout=reverse --border=sharp `
        --prompt='>>> ' --marker='| ' --info='inline' `
        --header='Younger Searching' `
        --preview='bat --color=always --number {} 2> nul || lsd -l --color=always --icon=always --blocks=permission,inode,size,date,name {} && lsd -A --color=always --icon=always --tree --depth=2 {}' `
        --preview-window=right:sharp:55% `
        --bind 'ctrl-y:execute-silent(bat {} | clip)+abort' `
        --bind='ctrl-a:toggle-all' `
        --bind='ctrl-p:toggle-preview' `
        --bind='ctrl-l:clear-screen' `
        --bind='ctrl-d:preview-half-page-down' `
        --bind='ctrl-u:preview-half-page-up' `
        --bind='ctrl-f:page-down' `
        --bind='ctrl-b:page-up' `

}
