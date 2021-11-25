# set -gx SHELL $__fish_bin_dir/fish

if status --is-login
    # set -px PATH ~/linux/bin
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function on_exit --on-event fish_exit
    echo fish is now exiting
end

# zoxide
if test -x (command -s zoxide)
    set -gx _ZO_ECHO 1
    zoxide init fish | source   
    function zz
        __zoxide_zi $argv
    end
end

# navi
if test -x (command -s navi)
    navi widget fish | source
end
