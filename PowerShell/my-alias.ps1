$myalias = $PSCommandPath

# [Alias]
#--------------------------   Set Alias Begin    ---------------------
Set-Alias open Invoke-Item
Set-Alias lg lazygit
Set-Alias smap Set-PSReadLineKeyHandler
Set-Alias gmap Get-PSReadLineKeyHandler
Set-Alias ww which
Set-Alias ss scoop 
Set-Alias sys macchina 
#--------------------------    Set Alias END     ---------------------

# [Directory]
function ensure-dir($dir) {
  if ((Test-Path "$dir") -eq $false) {
    New-Item "$dir" -ItemType Directory
  }
}

# $env:APPDATA
$roamData = "$HOME\AppData\Roaming"
# $env:LOCALAPPDATA
$localData = "$HOME\AppData\Local"

$bin = "$HOME\.local\bin"
$share = "$HOME\.local\share"
$config = "$HOME\.config"

# ($config, $share, $bin).foreach{ ensure-dir $dir }
foreach ($dir in ($config, $share, $bin)) {
  ensure-dir $dir
}

# Scoop
$scoop = $env:SCOOP
$apps = "$scoop\apps"
$cache = "$scoop\cache"
$bucket = "$scoop\buckets"
$shims = "$scoop\shims"
$localshims = "$localData\shims"
$persist = "$scoop\persist"

# App
$wt = "$localData\Microsoft\Windows Terminal"

$code = "$roamData\Code\User"

$nvim = "$config\nvim"
$neovim = "$share\nvim-data"
$packer = "$neovim\site\pack\packer"
$lsp = "$neovim\lsp_servers"

$lvim = "$config\lvim"
$lunar = "$share\lunarvim"
$lunarpacker = "$lunar\site\pack\packer"
if (Test-Path $bin\lunar) {
  $env:GIT_EDITOR = 'lunar'
}

# Other
$icon = "$HOME\Beauty\Icons"
$note = "$HOME\desktop\Notes"
$book = "$HOME\Documents\0-Book and Materials"

# [File]
$HOSTS = "$env:SystemRoot\system32\drivers\etc\hosts";
$AHK = "$config\AutoHotkeyU64.ahk"

# [env]
# qv2ray
$env:QV2RAY_CONFIG_PATH = "$config\qv2ray"
# ripgrep
$env:RIPGREP_CONFIG_PATH = "$config\rgrc"

