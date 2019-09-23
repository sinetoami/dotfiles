# Config file for Powerlevel10k with the style of Pure (https://github.com/sindresorhus/pure).
#
# Differences from Pure:
#
#   - Git:
#     - `@c4d3ec2c` instead of something like `v1.4.0~11` when in detached HEAD state.
#     - No automatic `git fetch` (the same as in Pure with `PURE_GIT_PULL=0`).
#
# The replication of Pure prompt achieved with this config is almost exact. Apart from the
# differences listed above, prompt is identical to Pure. This includes even the bad parts.
# For example, just like in Pure, prompt will provide no indication of Git status being stale.
# When prompt doesn't fit on one line, it'll wrap around with no attempt to shorten anything.
# This is likely to make user experience worse than with any other Powerlevel10k config. If
# you like the general style of Pure but not particularly attached to all its quirks, type
# `p10k configure` while having Powerlevel10k theme active and pick lean style.

# Temporarily disable aliases.
if [[ -o 'aliases' ]]; then
	'builtin' 'unsetopt' 'aliases'
	local p10k_pure_restore_aliases=1
else
	local p10k_pure_restore_aliases=0
fi

() {
	emulate -L zsh
	setopt no_unset

	typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
		dir                       # current directory
		vcs                       # git status
		command_execution_time    # previous command duration
		newline                   # \n
		virtualenv                # python virtual environment
		prompt_char               # prompt symbol
	)
	typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
		status
		go_version
	)

	# Basic style options that define the overall look of your prompt.
	typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
	typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
	typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
	typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol
	typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=           # disable segment icons

	# Add an empty line before each prompt. 
	typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true


	################################[ prompt_char: prompt symbol ]################################
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

	##################################[ dir: current directory ]##################################
	# Blue current directory.
	typeset -g POWERLEVEL9K_DIR_FOREGROUND=blue
	# Enable special styling for non-writable directories.
	typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true
	typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND='red'

	typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
	typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=""
	typeset -g POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

	#####################################[ vcs: git status ]######################################
	# Branch icon. Set this parameter to '\uF126 ' for the popular Powerline branch icon.
	typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=

	# Untracked files icon. It's really a question mark, your font isn't broken.
	# Change the value of this parameter to show a different icon.
	typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

	# Git status: feature:master#tag ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
	#
	# You can edit the lines below to customize how Git status looks.
	#
	# VCS_STATUS parameters are set by gitstatus plugin. See reference:
	# https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
	local vcs=''
	# If on a branch...
	vcs+='${${VCS_STATUS_LOCAL_BRANCH:+%242F'${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}
	# If local branch name is at most 32 characters long, show it in full.
	# This is the equivalent of POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=32.
	vcs+='${${${$(($#VCS_STATUS_LOCAL_BRANCH<=32)):#0}:+${VCS_STATUS_LOCAL_BRANCH//\%/%%}}'
	# If local branch name is over 32 characters long, show the first 12 … the last 12. The same as
	# POWERLEVEL9K_VCS_SHORTEN_LENGTH=12 with POWERLEVEL9K_VCS_SHORTEN_STRATEGY=truncate_middle.
	vcs+=':-${VCS_STATUS_LOCAL_BRANCH[1,12]//\%/%%}%28F…%76F${VCS_STATUS_LOCAL_BRANCH[-12,-1]//\%/%%}}}'
	# '@72f5c8a' if not on a branch.
	vcs+=':-%f@%242F${VCS_STATUS_COMMIT[1,8]}}'
	# ':master' if the tracking branch name differs from local branch.
	vcs+='${${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH}:+%f:%242F${VCS_STATUS_REMOTE_BRANCH//\%/%%}}'
	# '#tag' if on a tag.
	vcs+='${VCS_STATUS_TAG:+%f#%242F${VCS_STATUS_TAG//\%/%%}}'
	# ⇣42 if behind the remote.
	vcs+='${${VCS_STATUS_COMMITS_BEHIND:#0}:+ %6F⇣${VCS_STATUS_COMMITS_BEHIND}}'
	# ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
	# If you want '⇣42 ⇡42' instead, replace '${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+ }' with ' '.
	vcs+='${${VCS_STATUS_COMMITS_AHEAD:#0}:+${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+ }%6F⇡${VCS_STATUS_COMMITS_AHEAD}}'
	# *42 if have stashes.
	vcs+='${${VCS_STATUS_STASHES:#0}:+ %242F*${VCS_STATUS_STASHES}}'
	# 'merge' if the repo is in an unusual state.
	vcs+='${VCS_STATUS_ACTION:+ %196F${VCS_STATUS_ACTION//\%/%%}}'
	# ~42 if have merge conflicts.
	vcs+='${${VCS_STATUS_NUM_CONFLICTED:#0}:+ %242F~${VCS_STATUS_NUM_CONFLICTED}}'
	# +42 if have staged changes.
	vcs+='${${VCS_STATUS_NUM_STAGED:#0}:+ %242F+${VCS_STATUS_NUM_STAGED}}'
	# !42 if have unstaged changes.
	vcs+='${${VCS_STATUS_NUM_UNSTAGED:#0}:+ %242F!${VCS_STATUS_NUM_UNSTAGED}}'
	# ?42 if have untracked files. It's really a question mark, your font isn't broken.
	# See POWERLEVEL9K_VCS_UNTRACKED_ICON below if you want to use a different icon.
	# Remove the next line if you don't want to see untracked files at all.
	vcs+='${${VCS_STATUS_NUM_UNTRACKED:#0}:+ %242F'${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}'${VCS_STATUS_NUM_UNTRACKED}}'
	# If P9K_CONTENT is not empty, leave it unchanged. It's either "loading" or from vcs_info.
	vcs="\${P9K_CONTENT:-$vcs}"

	# Disable the default Git status formatting.
	typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
	# Install our own Git status formatter.
	typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_CONTENT_EXPANSION=$vcs
	# When Git status is being refreshed asynchronously, display the last known repo status in grey.
	typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION=${${vcs//\%f}//\%<->F}
	# Enable counters for staged, unstaged, etc.
	typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

	# Icon color.
	typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=76
	# Custom icon.
	typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=
	# Custom prefix.
	# typeset -g POWERLEVEL9K_VCS_PREFIX='%fon '

	# Show status of repositories of these types. You can add svn and/or hg if you are
	# using them. If you do, your prompt may become slow even when your current directory
	# isn't in an svn or hg reposotiry.
	typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

	typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=242
	# These settings are used for respositories other than Git or when gitstatusd fails and
	# Powerlevel10k has to fall back to using vcs_info.
	typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=242
	typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=242
	typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=242

	# Context format when root: user@host. The first part white, the rest grey.
	typeset -g POWERLEVEL9K_CONTEXT_ROOT_CONTENT_EXPANSION='%7F%n%f%242F@%m%f'
	# Context format when connected over SSH: user@host. The whole thing grey.
	typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_CONTENT_EXPANSION='%242F%n@%m%f'
	# Don't show context when not rood and not connected over SSH.
	typeset -g POWERLEVEL9K_CONTEXT_CONTENT_EXPANSION=
	typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true

	###################[ command_execution_time: duration of the last command ]###################
	# Show previous command duration only if it's >= 5s.
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=5
	# Don't show fractional seconds. Thus, 7s rather than 7.3s.
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
	# Duration format: 1d 2h 3m 4s.
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
	# Yellow previous command duration.
	typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=yellow

	##########################[ status: exit code of the last command ]###########################
	# Status on success. No content, just an icon.
	# Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
	# style them independently from the regular OK and ERROR state.
	typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

	# Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
	# it will signify error by turning red.
	typeset -g POWERLEVEL9K_STATUS_ERROR=true
	typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=red
	typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='↵'

	# Status when the last command was terminated by a signal.
	typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
	typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=red
	typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='↵'

	# Status when some part of a pipe command fails and the overall exit status is also non-zero.
	# It may look like this: 1|0.
	typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
	typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=red
	typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='↵'

	typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND='blue'
}
(( ! p10k_pure_restore_aliases )) || setopt aliases
'builtin' 'unset' 'p10k_pure_restore_aliases'
