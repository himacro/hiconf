if status is-interactive
    # Commands to run in interactive sessions can go here
end

if which starship >/dev/null 2>&1
    source (starship init fish --print-full-init | psub)
else
    echo "`starship` isn't installed"
end

if which zoxide >/dev/null 2>&1
    zoxide init --cmd j fish | source
else
    echo "`zoxide` isn't installed"
end




