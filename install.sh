#!/usr/bin/env sh

# Setup colors
WHITE=$(printf '\033[37m')
GREENB=$(printf '\033[32m')
RED=$(printf '\033[31m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')

WHITEB=$(printf '\033[1;37m')
GREENB=$(printf '\033[1;32m')
REDB=$(printf '\033[1;31m')
YELLOWB=$(printf '\033[1;33m')
BLUEB=$(printf '\033[1;34m')
OFF=$(printf '\033[m')

charok=""
charer=""

# Message to shows up at to the end of installation
function quite_message() {
  echo -e "${GREEN}"
  echo "            The installation was quite a success!                ";
  echo "                                                                 ";
  echo "     o          |                |     |    ,---.o|              ";
  echo ",---..,---.,---.|--- ,---.   ,---|,---.|--- |__. .|    ,---.,---.";
  echo "\`---.||   ||---'|    |   |---|   ||   ||    |    ||    |---'\`---.";
  echo "\`---'\`\`   '\`---'\`---'\`---'   \`---'\`---'\`---'\`    \`\`---'\`---'\`---'";
  echo "                                                                     ";
  echo -e "${YELLOW}"
  echo "                           GitHub:                                   "
  echo "            https://github.com/sinetoami/dotfiles                        ";
  echo ""
  echo ''
  echo -e "${NORMAL}"
}

# Print checked status with brackets colorized
function getstatus() {
	printf "$1[$1$2$1]$OFF"
}

# Message with status ok
function okay() {
	status=$(getstatus "$GREENB" "$charok")
	echo -e ${WHITEB}"Check: $@.$status"${OFF}
}

# Message with status error
function error() {
	status=$(getstatus "$REDB" "$charer")
	echo -e ${WHITEB}"Error: $@.$status"${OFF}
}

# Define default settings
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_ROOT=${DOTFILES_ROOT:-$HOME/.dotfiles}
REPOSITORY=${REPOSITORY:-sinetoami/dotfiles}
DOTFREPO=${DOTFREPO:-https://github.com/${REPOSITORY}.git}
BRANCH=${BRANCH:-master}
# ASDF_VERSION=${ASDF_VERSION:-v0.7.3}

# Check if exist a command
function command_exists() {
	command -v "$@" >/dev/null 2>&1
}

# Install dependencies from Arch Linux packages
function __deps_install() {
	local packages=(
		git
		curl
		wget
		zsh
		tmux
		neovim
		python-neovim
		stow
	)
	
	sudo pacman -S "${packages[@]}" || {
		error "failed to install packages"
		exit 1
	}

	okay "packages successfully installed"
}

# Cloning .dotfiles git repo
function __setup_dotfiles() {
  git clone --depth=1 --branch "$BRANCH" "$DOTFREPO" "$DOTFILES_ROOT" || {
	  error "git clone .dotfiles failed"
	  exit 1
  }
}

command_exists git || {
	error "git not found"
	
	printf ${YELLOW}
	cat <<- EOF
	To dependencies install:
	    $ ./install.sh --deps
	EOF
	printf ${OFF}

	exit 1
}

cmd=$1
case "$cmd" in
	--logo)
		__print_logo
	;;
	--deps)
		__deps_install
	;;
	--dotfiles)
		__setup_dotfiles
	;;
  *)
    echo "nothing to do"
    exit 1
    ;;
esac
