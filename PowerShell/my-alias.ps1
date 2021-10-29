$myalias = $PSCommandPath

# [Alias]
#--------------------------   Set Alias Begin    ---------------------
Set-Alias open Invoke-Item
Set-Alias lg lazygit
Set-Alias smap Set-PSReadLineKeyHandler
Set-Alias gmap Get-PSReadLineKeyHandler
Set-Alias ww which
Set-Alias ss scoop 
Set-Alias lvim "$HOME\.local\bin\lvim.ps1"
#--------------------------    Set Alias END     ---------------------

# [Directory]
# $env:LOCALAPPDATA
$localData = "$HOME\AppData\Local"
# $env:APPDATA
$roamData = "$HOME\AppData\Roaming"

$config = "$HOME\.config"
$share = "$HOME\.local\share"
$bin = "$HOME\.local\bin"

# Scoop
$scoop = $env:SCOOP
$apps = "$scoop\apps"
$cache = "$scoop\cache"
$bucket = "$scoop\buckets"
$shims = "$scoop\shims"
$persist = "$scoop\persist"

# App
$wt = "$localData\Microsoft\Windows Terminal"
$code = "$roamData\Code\User"
$nvim = "$localData\nvim"
$packer = "$localData\nvim-data\site\pack\packer"
$lvim = "$config\lvim"
$lunar = "$share\lunarvim"
$lpacker = "$lunar\site\pack\packer"

# Other
$icon = "$HOME\Beauty\Icons"
$notes = "$HOME\desktop\Notes"
$book = "$HOME\Documents\0-Book and Materials"

# [File]
$HOSTS = "$env:SystemRoot\system32\drivers\etc\hosts";
$AHK = "$config/AutoHotkeyU64.ahk"

# [env]
# qv2ray
$env:QV2RAY_CONFIG_PATH = "$config\qv2ray"
# ripgrep
$env:RIPGREP_CONFIG_PATH = "$config\rgrc"

