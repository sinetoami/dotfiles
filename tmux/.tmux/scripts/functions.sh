_is_enabled() {
  ( ([ x"$1" = x"enabled" ] || [ x"$1" = x"true" ] || [ x"$1" = x"yes" ] || [ x"$1" = x"1" ]) && return 0 ) || return 1
}

_tty_info() {
	tty="${1##/dev/}"
	uname -s | grep -q "CYGWIN" && cygwin=true

	if [ x"$cygwin" = x"true" ]; then
	 ps -af | tail -n +2 | awk -v tty="$tty" '
	   ((/ssh/ && !/-W/) || !/ssh/) && $4 == tty {
		 user[$2] = $1; parent[$2] = $3; child[$3] = $2
	   }
	   END {
		 for (i in user)
		 {
		   if (!(i in child) && parent[i] != 1)
		   {
			 file = "/proc/" i "/cmdline"; getline command < file; close(file)
			 gsub(/\0/, " ", command)
			 print i, user[i], command
			 exit
		   }
		 }
	   }
	 '
	else
	 ps -t "$tty" -o user=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -o pid= -o ppid= -o command= | awk '
	   NR > 1 && ((/ssh/ && !/-W/) || !/ssh/) {
		 user[$2] = $1; parent[$2] = $3; child[$3] = $2; for (i = 4 ; i <= NF; ++i) command[$2] = i > 4 ? command[$2] FS $i : $i
	   }
	   END {
		 for (i in parent)
		 {
		   if (!(i in child) && parent[i] != 1)
		   {
			 print i, user[i], command[i]
			 exit
		   }
		 }
	   }
	 '
	fi
}

_ssh_or_mosh_args() {
	args=$(printf '%s' "$1" | awk '/ssh/ && !/vagrant ssh/ && !/autossh/ && !/-W/ { $1=""; print $0; exit }')
	if [ -z "$args" ]; then
		args=$(printf '%s' "$1" | grep 'mosh-client' | sed -E -e 's/.*mosh-client -# (.*)\|.*$/\1/' -e 's/-[^ ]*//g' -e 's/\d:\d//g')
	fi

	printf '%s' "$args"
}
