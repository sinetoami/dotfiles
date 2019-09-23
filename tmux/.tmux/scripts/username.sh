#!/bin/bash
source ~/.tmux/scripts/functions.sh

_username() {
	tty=${1:-$(tmux display -p '#{pane_tty}')}
	ssh_only=$2

	tty_info=$(_tty_info "$tty")
	command=$(printf '%s' "$tty_info" | cut -d' ' -f3-)

	ssh_or_mosh_args=$(_ssh_or_mosh_args "$command")
	if [ -n "$ssh_or_mosh_args" ]; then
	 # shellcheck disable=SC2086
	 username=$(ssh -G $ssh_or_mosh_args 2>/dev/null | awk 'NR > 2 { exit } ; /^user / { print $2 }')
	 # shellcheck disable=SC2086
	 [ -z "$username" ] && username=$(ssh -T -o ControlPath=none -o ProxyCommand="sh -c 'echo %%username%% %r >&2'" $ssh_or_mosh_args 2>&1 | awk '/^%username% / { print $2; exit }')
	else
	 if ! _is_enabled "$ssh_only"; then
	   username=$(printf '%s' "$tty_info" | cut -d' ' -f2)
	 fi
	fi

	if [ x"$username" = x"root" ]; then
		echo "#[fg=brightred,bg=#2d2a2e,bold]  $username"
	else
		echo "#[fg=brightgreen,bg=#2d2a2e,bold]  $username"
	fi
}

_username
