#!/bin/bash
source ~/.tmux/scripts/functions.sh

_hostname() {
	tty=${1:-$(tmux display -p '#{pane_tty}')}
	ssh_only=$2

	tty_info=$(_tty_info "$tty")
	command=$(printf '%s' "$tty_info" | cut -d' ' -f3-)

	ssh_or_mosh_args=$(_ssh_or_mosh_args "$command")
	if [ -n "$ssh_or_mosh_args" ]; then
		# shellcheck disable=SC2086
		hostname=$(ssh -G $ssh_or_mosh_args 2>/dev/null | awk 'NR > 2 { exit } ; /^hostname / { print $2 }')
		# shellcheck disable=SC2086
		[ -z "$hostname" ] && hostname=$(ssh -T -o ControlPath=none -o ProxyCommand="sh -c 'echo %%hostname%% %h >&2'" $ssh_or_mosh_args 2>&1 | awk '/^%hostname% / { print $2; exit }')
		#shellcheck disable=SC1004
		hostname=$(echo "$hostname" | awk '\
		{ \
			if ($1~/^[0-9.:]+$/) \
				print $1; \
			else \
				split($1, a, ".") ; print a[1] \
		}')
	else
		if ! _is_enabled "$ssh_only"; then
			hostname=$(command hostname -s)
		fi
	fi

	printf '%s' "$hostname"
}

_hostname
