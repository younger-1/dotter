$mywsl = $PSCommandPath

function arc($name) { wsl -d Arch $name }
function ubt($name) { wsl -d Ubuntu-18.04 $name }
function arcEmacs {
    wsl -d Arch emacs $args 
}
function arcNvim {
    wsl -d Arch nvim $args 
}

function ra($name) { 
    if ($name) {
        cd $name; 
    }
    wsl.exe -d Arch ranger --choosedir=/tmp/rangerdir-wsl
    $dir = wsl.exe -d Arch cat /tmp/rangerdir-wsl
    $dir = wsl.exe -d Arch wslpath -m $dir
    cd $dir
}

function rar($name) { 
    if ($name) {
        cd $name; 
    }
    $temp = [System.IO.Path]::GetTempFileName()
    $temp = $temp.Replace("\", "/")
    $wsl_temp = wsl.exe -d Arch wslpath $temp
    wsl.exe -d Arch ranger --choosedir=$wsl_temp
    if (test-path -pathtype leaf "$temp") {
        $wsl_dir = Get-Content "$temp"
        $dir = wsl.exe -d Arch wslpath -m $wsl_dir
        remove-item -force "$temp"
        if (test-path -pathtype container "$dir") {
            if ("$dir" -ne "$pwd") {
                cd "$dir"
            }
        }
    } 
}

function wslip() {
    # find ip of eth0
    $ifconfig = (wsl -d arch -- ip -4 addr show eth0)
    $ipPattern = "((\d+\.?){4})"
    $ip = ([regex]"inet $ipPattern").Match($ifconfig).Groups[1].Value
    if (-not $ip) {
        exit
    }
    Write-Host $ip
}
