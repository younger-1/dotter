if status --is-login
    # set -px PATH ~/linux/bin
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function on_exit --on-event fish_exit
    echo fish is now exiting
end
