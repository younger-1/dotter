
# https://stackoverflow.com/questions/817198/how-can-i-get-the-current-powershell-executing-file
$myfunc = $PSCommandPath

#-------------------------------    Functions BEGIN   -------------------------------
#-------------------------------    Functions END     -------------------------------

<# Usage:
    1. which vim
    2. which vim d
    3. which *.cmd
#>
function which($name) { 
    if ($args[0] -eq 'd') {
        # Get-Command $name | Select-Object Definition
        (Get-Command $name).Definition | bat --language=ps1
    }
    else {
        Get-Command $name
    }
}
function what($name) {
    bat (Get-Command $name).Definition
}

function wan ($name) { 
    if ($args[0] -eq 'o') {
        Get-Help -Online $name 
    }
    elseif ($args[0] -eq 'w') {
        Get-Help -ShowWindow $name 
    }
    elseif ($args[0] -eq 'f') {
        Get-Help -Full $name | bat --language=ps1
    }
    elseif ($args[0] -eq 'e') {
        Get-Help -Examples $name | bat --language=ps1
    }
    else {
        Get-Help -Detailed $name | bat --language=ps1  
    }
}


function .. { cd .. }
function ... { cd ..\.. }
function cd- { cd - }
function cd+ { cd + }
function cdd($name) {
    # https://stackoverflow.com/questions/9725521/how-to-get-the-parents-parent-directory-in-powershell
    # cd (Get-Item $args[0]).Directory.parent.FullName
    cd (Split-Path -Path $name -Parent)
}

function killall {
    $commands = Get-Process -Name $args[0]
    foreach ($command in $commands) {
        Stop-Process $command.Id
    }
}

<# Usage:
  1. ef
  2. ef $SCOOP
  3. ef $HOSTS
#>
function ef($name) {
    if ($null -eq $name) {
        explorer.exe .
        return
    }
    $name = $name -replace '/', '\'
    if (Test-Path -Path $name -PathType Container) {
        explorer.exe $name
    }
    elseif (Test-Path -Path $name -PathType Leaf) {
        explorer.exe (Split-Path -Path $name -Parent)
    }
}

# Get alias of a cmdlet
function gcl ($cmdletname) {
    Get-Alias |
    Where-Object -FilterScript { $_.Definition -like "$cmdletname" } |
    Format-Table -Property Definition, Name -AutoSize
}

# test for `man about_Profiles`
function colorConsole {
    $host.ui.rawui.backgroundcolor = "white"
    $host.ui.rawui.foregroundcolor = "black"
    $hosttime = (Get-ChildItem $pshome\PowerShell.exe).creationtime
    $Host.UI.RawUI.WindowTitle = "Windows PowerShell $hostversion ($hosttime)"
    clear-host
}

# function prompt {
#     $p = $($executionContext.SessionState.Path.CurrentLocation)
#     $converted_path = Convert-Path $p
#     $ansi_escape = [char]27
#     Write-Host $Env:CONDA_PROMPT_MODIFIER -NoNewline
#     Write-Host $env:USERNAME -ForegroundColor Green -NoNewline
#     Write-Host "@" -ForegroundColor White -NoNewLine
#     Write-Host $env:COMPUTERNAME -ForegroundColor Blue -NoNewLine
#     Write-Host " " -NoNewLine
#     Write-Host $p -NoNewLine
#     "PS $('>' * ($nestedPromptLevel + 1)) ";
#     Write-Host "$ansi_escape]7;file://$env:COMPUTERNAME/$converted_path$ansi_escape\" -NoNewline
#     Write-Host "$ansi_escape]9;9;$converted_path$ansi_escape\"
# }

# thefuck
# iex "$(thefuck --alias)"

function Update-Packages {
    # update pip
    Write-Host "Step 1: 更新 pip" -ForegroundColor Magenta -BackgroundColor Cyan
    $a = pip list --outdated
    $num_package = $a.Length - 2
    for ($i = 0; $i -lt $num_package; $i++) {
        $tmp = ($a[2 + $i].Split(" "))[0]
        pip install -U $tmp
    }

    # update TeX Live
    $CurrentYear = Get-Date -Format yyyy
    Write-Host "Step 2: 更新 TeX Live" $CurrentYear -ForegroundColor Magenta -BackgroundColor Cyan
    tlmgr update --self
    tlmgr update --all
}

# <https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/setting-permanent-environment-variables>
function Set-Env
{
  param
  (
    [Parameter(Mandatory=$true)]
    [String]
    $Name,

    [Parameter(Mandatory=$true)]
    [String]
    $Value,

    [EnvironmentVariableTarget]
    $Target = "Process"
  )
  [System.Environment]::SetEnvironmentVariable($Name, $Value, $Target)
}

# <https://github.com/lukesampson/psutils/blob/master/shim.ps1#L32>
function pick-env($name,$val='__get') {
	$target = 'User'
	if($val -eq '__get') { [environment]::getEnvironmentVariable($name,$target) }
	else { [environment]::setEnvironmentVariable($name,$val,$target) }
}

function prepend-path($dir) {
	$path = pick-env 'path'
	$dir = resolve-path $dir
	if($path -notmatch [regex]::escape($dir)) {
		echo "adding $dir to your path."
		pick-env 'path' "$dir;$path" # for future sessions...
	} 
  $env:path = "$dir;$env:path" # for this session
}

# <https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/taking-screenshot>
# <https://ephos.github.io/posts/2018-8-20-Timers>
# <https://stackoverflow.com/questions/1741490/how-to-tell-powershell-to-wait-for-each-command-to-end-before-starting-the-next>
function Capture-Screen
{
  param
  (
    [Int]
    $time = 0
  )

  $uid = Get-Random
  $Path = "$Env:temp\screenshot-$uid.bmp"
  Write-Host $Path

  Add-Type -AssemblyName System.Windows.Forms
  $screen = [System.Windows.Forms.SystemInformation]::VirtualScreen

  $width = $screen.Width
  $height = $screen.Height
  $left = $screen.Left
  $top = $screen.Top

  $bitmap = [System.Drawing.Bitmap]::new($width, $height)
  $MyDrawing = [System.Drawing.Graphics]::FromImage($bitmap)

  # Start-Job -ScriptBlock { Start-Sleep -Seconds $time } | Wait-Job
  Start-Sleep -Seconds $time 
  $MyDrawing.CopyFromScreen($left, $top, 0, 0, $bitmap.Size)

  $bitmap.Save($Path)

  Start-Process -FilePath $Path
}

# <https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/simple-built-in-password-generator>
function Generate-Passward
{
  param
  (
    # total password length
    [Int]
    $Length = 10,

    # number of non-alpha-chars
    [Int]
    $NonChar = 4
  )

  Add-Type -AssemblyName 'System.Web'
  $password = [System.Web.Security.Membership]::GeneratePassword($Length, $NonChar)
  "Your password: $password"
}

<#
    Directory: C:\Users\younger\.local\share

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----           2021/8/29     1:43                firenvim
d----           2019/11/4    22:16                jupyter
d----           2021/9/11    14:24                lunarvim
d----           2021/11/2    11:07                nvim-data
d----           2021/9/27    12:08                rizin
d----            2021/2/1    18:00                vifm
d----           2021/8/28    14:36                wezterm
d----            2021/1/7    19:01                xonsh

    Directory: C:\Users\younger\.config

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----           2021/8/27     0:00                alacritty
d----            2020/1/4    11:43                clash
d----          2021/10/24    22:09                coc
d----          2021/10/26    15:22                configstore
d----           2020/5/16    11:31                dask
d----           2021/8/31     0:22                git
d----           2021/4/21     3:21                joplin-desktop
d----           2021/8/29     0:09                lazygit
d----           2021/11/1    12:56                lvim
d----          2020/12/27    19:47                micro
d----           2020/7/25    22:29                neofetch
d----          2021/10/23    17:21                nvim
d----           2020/3/12    12:31                octave
d----           2020/2/19    13:15                pshazz
d----            2021/5/7     0:54                qv2ray
d----           2021/9/21    10:33                s
d----           2021/8/22    21:53                scoop
d----           2021/8/27    23:02                thefuck
d----            2021/9/4    23:39                vifm
d----            2020/7/4     0:43                xonsh
la---           2021/8/27    23:02              0 AutoHotkeyU64.ahk -> C:\Users\younger\dotter\autohotkeyU64.ahk
-a---           2020/6/30    17:25             52 GithubKeyStore.txt
-a---          2019/11/18    12:27            104 hub
la---            2021/9/3    23:04              0 rgrc -> C:\Users\younger\dotter\rgrc
la---           2021/8/27    23:02              0 starship.toml -> C:\Users\younger\dotter\starship.toml

#>

function setup-xdg {
  $env:XDG_DATA_HOME = "$HOME\.local\share"
  $env:XDG_CONFIG_HOME = "$HOME\.config"
  $env:XDG_CACHE_HOME = "$HOME\.cache"
  Set-Env XDG_DATA_HOME $HOME\.local\share User
  Set-Env XDG_CONFIG_HOME $HOME\.config User
  Set-Env XDG_CACHE_HOME $HOME\.cache User
}

function setup-lunarvim {
  # $env:LUNARVIM_RUNTIME_DIR = ($env:LUNARVIM_RUNTIME_DIR, "$env:XDG_DATA_HOME\lunarvim", 1 -ne $null)[0]
  # $env:LUNARVIM_CONFIG_DIR = ($env:LUNARVIM_CONFIG_DIR, "$env:XDG_CONFIG_HOME\lvim", 1 -ne $null)[0]    
  # $env:LUNARVIM_CACHE_DIR = ($env:LUNARVIM_CACHE_DIR, "$env:XDG_CACHE_HOME\lvim", 1 -ne $null)[0]

  # $env:LUNARVIM_RUNTIME_DIR = "$HOME\.local\share\lunarvim"
  # $env:LUNARVIM_CONFIG_DIR = "$HOME\.config\lvim"
  # $env:LUNARVIM_CACHE_DIR = "$HOME\.cache\lvim"
  # Set-Env LUNARVIM_RUNTIME_DIR $HOME\.local\share\lunarvim User
  # Set-Env LUNARVIM_CONFIG_DIR $HOME\.config\lvim User
  # Set-Env LUNARVIM_CACHE_DIR $HOME\.cache\lvim User

  $lvim_ps1_path = "$env:XDG_DATA_HOME\lunarvim\lvim\utils\bin\lvim.ps1"
  # 1. lvim.ps1: symbolic link
  New-Item -ItemType SymbolicLink -Path $bin\lvim.ps1 -Target $lvim_ps1_path -Force
  # or hard link
  # & "$env:COMSPEC" /c "mklink /h `"$bin\lvim.ps1`" `"$lvim_ps1_path`"" | Out-Null
  # 2. lunar: git use lvim as core editor
  Set-Content -Path $bin\lunar -Value $(-join @("#!/bin/sh", "`r`n", ('powershell.exe -noprofile -ex unrestricted "{0}" "$@"' -f $lvim_ps1_path)))
  # 3. lvim.cmd: make ps1 accessible from cmd.exe
  $content = "@echo off
setlocal enabledelayedexpansion
set args=%*
:: replace problem characters in arguments
set args=%args:`"='%
set args=%args:(=``(%
set args=%args:)=``)%
set invalid=`"='
if !args! == !invalid! ( set args= )
powershell -noprofile -ex unrestricted `"& '$lvim_ps1_path' $arg %args%;exit `$lastexitcode`"" 
  $content | Out-File $bin\lvim.cmd -Encoding ascii

  # use same tree-sitter
  # New-Item -ItemType SymbolicLink -Path $share\nvim-data\site\pack\packer\start\nvim-treesitter -Target $lunar\site\pack\packer\start\nvim-treesitter
  # Copy-Item -Path $lunar\site\pack\packer\start\nvim-treesitter\parser\* -Destination $share\nvim-data\site\pack\packer\start\nvim-treesitter\parser
}

# [proxy]
$HostIP = "127.0.0.1"
$HttpPort = 7890

function showproxy {
    Write-Host ""
    Write-Host "http_proxy=$env:http_proxy"
    Write-Host "https_proxy=$env:https_proxy"
    Write-Host ""
    echo "curl.exe --connect-timeout 2 baidu.com"
    curl.exe --connect-timeout 2 baidu.com
    Write-Host ""
    echo "curl.exe --connect-timeout 2 google.com"
    curl.exe --connect-timeout 2 google.com
}

function setproxy  {
    $env:http_proxy="http://${HostIP}:$HttpPort"
    $env:https_proxy="http://${HostIP}:$HttpPort"
}

function unsetproxy {
    $env:http_proxy=""
    $env:https_proxy=""
}

setproxy

function setv2ray {
    $HttpPort = 10809
    setproxy
    showproxy
}

function setclash {
    $HttpPort = 7890
    setproxy
    showproxy
}
