#!/usr/bin/env sh

# Setup colors
WHITE=$(printf '\033[37m')
GREEN=$(printf '\033[32m')
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
  echo -e "${OFF}"
}

function help_msg() {
	echo "USAGE: "
	echo "	./install.sh [OPTIONS]"
	echo
	echo "OPTIONS: "
	echo "	-help		Show this message helper"
	echo "	-deps		Install dependencies"
	echo "	-dotfiles	Clone and setup .dotfiles from GitHub repository"
	echo "	-neovim		Setup Neovim providers and configurations"
	echo "	-asdf		Install ASDF language version manager"
	exit 1
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
ASDF_VERSION=${ASDF_VERSION:-v0.7.3}

# Check if exist a command
function command_exists() {
	command -v "$@" >/dev/null 2>&1
}

# Install dependencies from Arch Linux packages
function __pacman() {
	sudo pacman -S "${@:2}" 2>/dev/null || {
		error "$1: failed to install ${@:2}"
		exit 1
	}

	okay "pacman: packages sucessfully installed."
}

function __deps_install() {
	local packages=(
		git
		curl
		wget
		zsh
		tmux
		neovim
		python-pynvim
		stow
	)

	__pacman "$FUNCNAME" "${packages[@]}"
	okay "$FUNCNAME :packages successfully installed"
}

# Cloning .dotfiles git repo
function __setup_dotfiles() {
  git clone --depth=1 --branch "$BRANCH" "$DOTFREPO" "$DOTFILES_ROOT" || {
	  error "$FUNCNAME: git clone .dotfiles failed"
	  exit 1
  }
}

function __setup_neovim() {
	## Setup Neovim providers
	# Python
	pip3 install --user pynvim
	pip3 install --user --upgrade pynvim

	# Ruby
	__pacman $FUNCNAME ruby
	gem install neovim

	# NodeJS
	__pacman $FUNCNAME nodejs npm
	npm install -g neovim

	# Link files
}

function __setup_asdf() {
	asdf_url="https://github.com/asdf-vm/asdf.git"

	if [[ $(command_exists asdf) ]]; then
		git clone "$asdf_url" "$HOME/.asdf" --branch "$ASDF_VERSION" 2>/dev/null || {
			error "$FUNCNAME: git clone asdf failed"
			exit 1
		}
		okay "$FUNCNAME: asdf successfully installed"
	else
		asdf update &>/dev/null
		okay "$FUNCNAME: asdf already installed"
	fi
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
	-msg)
		quite_message
	;;
	-help)
		help_msg
	;;
	-deps)
		__deps_install
	;;
	-dotfiles)
		__setup_dotfiles
	;;
	-neovim)
		__setup_neovim
	;;
	-asdf)
		__setup_asdf
	;;
  *)
	quite_message
    okay "nothing to do"
    exit 1
    ;;
esac
