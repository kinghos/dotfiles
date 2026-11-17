if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
zoxide init fish | source
# env vars
set -gx EDITOR micro
set -gx MANPAGER "bat -plman"

# >>> ESP-IDF EIM PATH >>>
# Added by ESP-IDF extension so the EIM CLI can be launched directly.
if not contains -- "/home/kingshuk/.espressif/eim_gui" $PATH
    set -gx PATH "/home/kingshuk/.espressif/eim_gui" $PATH
end
# <<< ESP-IDF EIM PATH <<<

# for fcc-server
if not contains -- "/home/kingshuk/.local/bin" $PATH
    set -gx PATH "/home/kingshuk/.local/bin" $PATH
end

# >>> ESP-IDF EIM PATH >>>
# Added by ESP-IDF extension so the EIM CLI can be launched directly.
if not contains -- "/usr/bin" $PATH
    set -gx PATH "/usr/bin" $PATH
end
# <<< ESP-IDF EIM PATH <<<

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end
