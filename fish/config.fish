set -gx SHELL $__fish_bin_dir/fish

if status --is-login
    # set -px PATH ~/linux/bin
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function on_exit --on-event fish_exit
    echo fish is now exiting
end

# volta
# set -gx VOLTA_HOME "$HOME/.volta"
# set -gx PATH "$VOLTA_HOME/bin" $PATH

# zoxide
if command -vq zoxide
    set -gx _ZO_ECHO 1
    zoxide init fish | source   
    function zz
        __zoxide_zi $argv
    end
end

# navi
if command -vq navi
    navi widget fish | source
end
