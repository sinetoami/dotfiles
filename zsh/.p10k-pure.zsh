# Config file for Powerlevel10k with the style of Pure (https://github.com/sindresorhus/pure).
#
# Differences from Pure:
#
#   - Git:
#     - `@c4d3ec2c` instead of something like `v1.4.0~11` when in detached HEAD state.
#     - No automatic `git fetch` (the same as in Pure with `PURE_GIT_PULL=0`).
#
# Apart from the differences listed above, the replication of Pure prompt is exact. This includes
# even the questionable parts. For example, just like in Pure, there is no indication of Git status
# being stale; prompt symbol is the same in command, visual and overwrite vi modes; when prompt
# doesn't fit on one line, it wraps around with no attempt to shorten it.
#
# If you like the general style of Pure but not particularly attached to all its quirks, type
# `p10k configure` while having Powerlevel10k theme active and pick "Lean" style.

# Temporarily change options.
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
	emulate -L zsh
	setopt no_unset extended_glob
	zmodload zsh/langinfo
	if [[ ${langinfo[CODESET]:-} != (utf|UTF)(-|)8 ]]; then
		local LC_ALL=${${(@M)$(locale -a):#*.(utf|UTF)(-|)8}[1]:-en_US.UTF-8}
	fi

	# Unset all configuration options. This allows you to apply configiguration changes without
	# restarting zsh. Edit ~/.p10k.zsh and type `source ~/.p10k.zsh`.
	unset -m 'POWERLEVEL9K_*'

	# Left prompt segments.
	typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	  dir                       # current directory
	  vcs                       # git status
	  context                   # user@host
	  command_execution_time    # previous command duration
	  newline                   # \n
	  prompt_char               # prompt symbol
	)

	# Right prompt segments.
	typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
		status
		go_version
		background_jobs
	)

	# Basic style options that define the overall prompt look.
	typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
	typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
	typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
	typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol
	typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=           # no segment icons

	# Add an empty line before each prompt except the first. This doesn't emulate the bug
	# in Pure that makes prompt drift down whenever you use the ALT-C binding from fzf or similar.
	typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

	# Magenta prompt symbol if the last command succeeded.
	typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=magenta
	# Red prompt symbol if the last command failed.
	typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=red
	# Default prompt symbol.
	typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
	# Prompt symbol in command vi mode.
	typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
	# Prompt symbol in visual vi mode is the same as in command mode. This is unlikely
	# to be desired by anyone but that's how Pure does it.
	typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='❮'
	# Prompt symbol in overwrite vi mode is the same as in command mode. This is unlikely
	# to be desired by anyone but that's how Pure does it.
	typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=false

	##################################[ dir: current directory ]##################################
	# Default current directory color.
	typeset -g POWERLEVEL9K_DIR_FOREGROUND=blue
	# If directory is too long, shorten some of its segments to the shortest possible unique
	# prefix. The shortened directory can be tab-completed to the original.
	typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
	# Replace removed segment suffixes with this symbol.
	typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
	# Color of the shortened directory segments.
	typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=blue
	# Color of the anchor directory segments. Anchor segments are never shortened. The first
	# segment is always an anchor.
	typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=blue
	# Don't shorten this many last directory segments. They are anchors.
	typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
	# Shorten directory if it's longer than this even if there is space for it. The value can
	# be either absolute (e.g., '80') or a percentage of terminal width (e.g, '50%'). If empty,
	# directory will be shortened only when prompt doesn't fit.
	typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
	# When `dir` segment is on the last prompt line, try to shorten it enough to leave at least this
	# many columns for typing commands.
	typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
	# When `dir` segment is on the last prompt line, try to shorten it enough to leave at least
	# COLUMNS * POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT * 0.01 columns for typing commands.
	typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
	# If set to true, embed a hyperlink into the directory. Useful for quickly
	# opening a directory in the file manager simply by clicking the link.
	# Can also be handy when the directory is shortened, as it allows you to see
	# the full directory that was used in previous commands.
	typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

	# Enable special styling for non-writable directories.
	typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true
	# Show this icon when the current directory is not writable. POWERLEVEL9K_DIR_SHOW_WRITABLE
	# above must be set to true for this parameter to have effect.
	# typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'

	# Custom prefix.
	# typeset -g POWERLEVEL9K_DIR_PREFIX='%fin '

	# POWERLEVEL9K_DIR_CLASSES allows you to specify custom icons for different directories.
	# It must be an array with 3 * N elements. Each triplet consists of:
	#
	#   1. A pattern against which the current directory is matched. Matching is done with
	#      extended_glob option enabled.
	#   2. Directory class for the purpose of styling.
	#   3. Icon.
	#
	# Triplets are tried in order. The first triplet whose pattern matches $PWD wins. If there
	# are no matches, the directory will have no icon.
	#
	# Example:
	#
	#   typeset -g POWERLEVEL9K_DIR_CLASSES=(
	#       '~/work(/*)#'  WORK     '(╯°□°）╯︵ ┻━┻'
	#       '~(/*)#'       HOME     '⌂'
	#       '*'            DEFAULT  '')
	#
	# With these settings, the current directory in the prompt may look like this:
	#
	#   (╯°□°）╯︵ ┻━┻ ~/work/projects/important/urgent
	#
	# Or like this:
	#
	#   ⌂ ~/best/powerlevel10k
	#
	# You can also set different colors for directories of different classes. Remember to override
	# FOREGROUND, SHORTENED_FOREGROUND and ANCHOR_FOREGROUND for every directory class that you wish
	# to have its own color.
	#
	#   typeset -g POWERLEVEL9K_DIR_WORK_FOREGROUND=31
	#   typeset -g POWERLEVEL9K_DIR_WORK_SHORTENED_FOREGROUND=103
	#   typeset -g POWERLEVEL9K_DIR_WORK_ANCHOR_FOREGROUND=39
	#
	typeset -g POWERLEVEL9K_DIR_CLASSES=()

	# Context format when root: user@host. The first part white, the rest grey.
	typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%7F%n%f%242F@%m%f'
	# Context format when not root: user@host. The whole thing grey.
	typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%242F%n@%m%f'
	# Don't show context unless root or in SSH.
	typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_CONTENT_EXPANSION=

	###################[ command_execution_time: duration of the last command ]###################
	# Show previous command duration only if it's >= 5s.
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=5
	# Don't show fractional seconds. Thus, 7s rather than 7.3s.
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
	# Duration format: 1d 2h 3m 4s.
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
	# Yellow previous command duration.
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=yellow

	#####################################[ vcs: git status ]######################################
	# Branch icon. Set this parameter to '\uF126 ' for the popular Powerline branch icon.
	typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=
	POWERLEVEL9K_VCS_BRANCH_ICON=${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}

	# Untracked files icon. It's really a question mark, your font isn't broken.
	# Change the value of this parameter to show a different icon.
	typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='\uF059'
	POWERLEVEL9K_VCS_UNTRACKED_ICON=${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}

	# Formatter for Git status.
	#
	# Example output: master ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
	#
	# You can edit the function to customize how Git status looks.
	#
	# VCS_STATUS_* parameters are set by gitstatus plugin. See reference:
	# https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
	function my_git_formatter() {
		emulate -L zsh

		if [[ -n $P9K_CONTENT ]]; then
			# If P9K_CONTENT is not empty, use it. It's either "loading" or from vcs_info (not from
			# gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
			typeset -g my_git_format=$P9K_CONTENT
			return
		fi

		if (( $1 )); then
		  # Styling for up-to-date Git status.
		  local       meta='%244F'     # default foreground
		  local      clean='%6F'   # green foreground
		  local   modified='%244F'  # yellow foreground
		  local  untracked='%244F'   # blue foreground
		  local conflicted='%244F'  # red foreground
		  local    loading='%244F'  # grey foreground
		else
		  # Styling for incomplete and stale Git status.
		  local       meta='%244F'  # grey foreground
		  local      clean='%244F'  # grey foreground
		  local   modified='%244F'  # grey foreground
		  local  untracked='%244F'  # grey foreground
		  local conflicted='%244F'  # grey foreground
		  local    loading='%244F'  # grey foreground
		fi

		local res
		local where  # branch name, tag or commit
		if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
		  res+="${clean}${POWERLEVEL9K_VCS_BRANCH_ICON}"
		  where=${(V)VCS_STATUS_LOCAL_BRANCH}
		elif [[ -n $VCS_STATUS_TAG ]]; then
		  res+="${meta}#"
		  where=${(V)VCS_STATUS_TAG}
		else
		  res+="${meta}@"
		  where=${VCS_STATUS_COMMIT[1,8]}
		fi

		# If local branch name or tag is at most 32 characters long, show it in full.
		# Otherwise show the first 12 … the last 12.
		(( $#where > 32 )) && where[13,-13]="…"
		res+="${meta}${where//\%/%%}"  # escape %

		# Show tracking branch name if it differs from local branch.
		if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
		  res+="${meta}:${meta}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"  # escape %
		fi

		# ⇣42 if behind the remote.
		(( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
		# ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
		(( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
		(( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
		# *42 if have stashes.
		(( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
		# 'merge' if the repo is in an unusual state.
		[[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
		# ~42 if have merge conflicts.
		(( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
		# +42 if have staged changes.
		(( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
		# !42 if have unstaged changes.
		(( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
		# ?42 if have untracked files. It's really a question mark, your font isn't broken.
		# See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
		# Remove the next line if you don't want to see untracked files at all.
		(( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}?${VCS_STATUS_NUM_UNTRACKED}"

		typeset -g my_git_format=$res
	}
	functions -M my_git_formatter 2>/dev/null

	# Disable the default Git status formatting.
	typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
	# Install our own Git status formatter.
	typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
	typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
	# Enable counters for staged, unstaged, etc.
	typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

	# Icon color.
	typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=76
	typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=244
	# Custom icon.
	typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=
	# Custom prefix.
	# typeset -g POWERLEVEL9K_VCS_PREFIX='%fon '

	# Show status of repositories of these types. You can add svn and/or hg if you are
	# using them. If you do, your prompt may become slow even when your current directory
	# isn't in an svn or hg reposotiry.
	typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

	# These settings are used for respositories other than Git or when gitstatusd fails and
	# Powerlevel10k has to fall back to using vcs_info.
	typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=6
	typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=244
	typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=244

	#######################[ go_version: go version (https://golang.org) ]########################
	# Go version color.
	typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=37
	# Show go version only when in a go project subdirectory.
	typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true
	# Custom icon.
	typeset -g POWERLEVEL9K_GO_VERSION_ICON=
	# typeset -g POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

	##########################[ status: exit code of the last command ]###########################
	# Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
	# style them independently from the regular OK and ERROR state.
	typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

	# Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
	# it will signify success by turning green.
	typeset -g POWERLEVEL9K_STATUS_OK=false
	typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=green
	typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'

	# Status when some part of a pipe command fails but the overall exit status is zero. It may look
	# like this: 1|0.
	typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
	typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=green
	typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'

	# Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
	# it will signify error by turning red.
	typeset -g POWERLEVEL9K_STATUS_ERROR=true
	typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=160
	typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='↵'

	# Status when the last command was terminated by a signal.
	typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
	typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=160
	# Use terse signal names: "INT" instead of "SIGINT(2)".
	typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=true
	typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='↵'

	# Status when some part of a pipe command fails and the overall exit status is also non-zero.
	# It may look like this: 1|0.
	typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
	typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=160
	typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='↵'

	#######################[ background_jobs: presence of background jobs ]#######################
	# Don't show the number of background jobs.
	typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
	# Background jobs color.
	typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=green
	# Icon to show when there are background jobs.
	typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='⇶'
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
