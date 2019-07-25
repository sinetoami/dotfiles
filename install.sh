#!/usr/bin/env bash

WHITE="\033[1;37m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
# BLUE="\033[1;34m"
RED="\033[1;31m"
OFF="\033[m"

charok=""
charer=""

export ASDF_VERSION="v0.7.3"

# print status with brackets colorized
getstatus() {
  printf "$1[$1$2$1]$OFF"
}

okay-msg() {
  status=$(getstatus "$GREEN" "$charok")
  echo -e "$WHITE$1.$OFF $status"
}

fail-msg() {
  status=$(getstatus "$RED" "$charer")
  echo -e "$WHITE$1.$OFF $status"
  exit 255
}

__print_logo() {
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

github_url="https://github.com"

# Export dotfiles root dir
export DOTFILES_ROOT
DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Cloning git repo
__clone_dotfiles() {
  url_repo="$github_url/sinetoami/dotfiles.git"

  env git clone --depth=1 $url_repo "$HOME/dotfiles" 2>&1 | {
    read -r -d "\0" -t 1.50 error
      if [[ $error =~ ^([Ee]rror): ]]; then
        fail-msg "Error: ${error}"
      fi
      okay-msg ".dotfiles: successfully cloned."
  }
}

# Install antibody
__install_antibody() {
  if ! [[ "$(command -v antibody)" = "" ]]; then
    okay-msg "antibody: already installed."
  else
	if [ $(curl -sL git.io/antibody | sh -s) ]; then
      fail-msg "antibody: Error $?"
    fi
    okay-msg "antibody: successfully installed."
  fi
}

# Install Tmux Plugin Manager
__install_tpm() {
  tpm_url="$github_url/tmux-plugins/tpm"

  if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    okay-msg "tpm: already installed."
  else
    cmd=$(git clone "$tpm_url" "$HOME/.tmux/plugins/tpm")
    if [ "$cmd" -gt 0 ]; then
      fail-msg "tpm: Error $?"
    fi
    tmux source-file "$HOME/.tmux.conf"
    okay-msg "tpm: successfully installed."
  fi
}

## Set up DevEnvironment

# install asdf
__install_asdf() {
  asdf_url="$github_url/asdf-vm/asdf.git"

  if [ -d "$HOME/.asdf" ];then
    okay-msg "asdf: already installed."
    asdf update &>/dev/null
  else
    cmd=$(git clone "$asdf_url" "$HOME/.asdf" --branch "$ASDF_VERSION")
    if [ "$cmd" -gt 0 ]; then
      fail-msg "asdf: Error $?"
    fi
    okay-msg "asdf: successfully installed."
  fi
}

# install lang plugin
__install_asdf_plugin() {
  plugin_url="$github_url/$1.git"
  asdf_plugin_list=$(asdf plugin-list)
  
  if [[ "${asdf_plugin_list[*]}" =~ $2 ]]; then
    okay-msg "dev$2: Plugin named $2 already installed."
    asdf plugin-update "$2" &>/dev/null
  else
    cmd=$(asdf plugin-add "$2" "$plugin_url")
    if [ "$cmd" -gt 0 ]; then
      fail-msg "dev$2: $2 plugin error $?"
    fi
    okay-msg "dev$2: $2 plugin successfully installed."
  fi
}

# install binary lang
__install_asdf_lang() {
  if ! [[ "$(command -v "$1")" = "" ]]; then
    okay-msg "dev$1: $1 $2 already installed."
  else
    cmd=$(asdf install "$1" "$2" 2>&1)
    if [ "$cmd" -gt 0 ]; then
      fail-msg "dev$1: $1 $2 install error $?"
    fi
    okay-msg "dev$1: $1 $2 successfully installed."
    asdf reshim "$1" "$2" &>/dev/null
  fi
}

# generate Gemfile
function gen_gemfile() {
cat > Gemfile <<- "EOF"
source 'https://rubygems.org'

gem "rails", "~> 5.2.2"
gem "rspec", "~> 3.8.0"
gem "minitest", "~> 5.11.3"
gem "minitest-utils", "~> 0.4.4"
gem "rubocop", "~> 0.63.0"
gem "reek", "~> 5.3.0"
gem "brakeman", "~> 4.4.0"
gem "rails_best_practices", "~> 1.19.4"
gem "solargraph", "~> 0.31.0"
gem "yard", "~> 0.9.16"
gem "tmuxinator", "~> 0.15.0"
gem "pry-meta", :git => "https://github.com/sinetoami/pry-meta.git"
EOF
}

# install most common gems to my basic set up environment
__install_ruby_gems() {
  if ! [[ -f Gemfile ]]; then
    gen_gemfile
  fi

  gem install bundler 2>&1 | {
    read -r -d "\0" -t 1.50 error
      if [[ $error =~ ERROR: ]]; then
        fail-msg "Error: $error"
      fi

      # install gems
      bundle install &>/dev/null
      # remove Gemfile
      rm Gemfile Gemfile.lock &>/dev/null
      # configure yard
      yard gems &>/dev/null
      okay-msg "devruby: gems successfully installed."
  }
}

# install most common golang packages to my set up environment
__install_go_packs() {
  declare -a packages=(
    github.com/sourcegraph/go-langserver
    github.com/opennota/check/cmd/aligncheck
    github.com/opennota/check/cmd/structcheck
    github.com/opennota/check/cmd/varcheck
    github.com/haya14busa/gopkgs/cmd/gopkgs
    github.com/motemen/gore
    github.com/k0kubun/pp
    github.com/sqs/goreturns
    github.com/rakyll/gotest
    github.com/kyoh86/richgo
    github.com/go-delve/delve/cmd/dlv
    golang.org/x/tools/cmd/godoc
    golang.org/x/vgo
    github.com/kisielk/errcheck
  )

  for package in "${packages[@]}"; do
    go get -u "$package" &>/dev/null
  done

  # install gometalinter
  goml_installer="goml_installer"
  curl -L https://git.io/vp6lP -o $goml_installer &>/dev/null
  chmod +x "$goml_installer"
  "./$goml_installer" -b "$GOPATH/bin" &>/dev/null
  rm -rf "$goml_installer" &>/dev/null

  # install dep
  cmd=$(sudo xbps-install -Sy dep 2>&1)
  if ! [ -x "/usr/bin/dep" ]; then
    if [ "$cmd" -gt 0 ]; then
      fail-msg "devgo: dep install error $?"
    fi
    okay-msg "devgo: dep successfully installed."
  fi

  okay-msg "devgo: golang packages successfully installed."
}

__read_lines() {
  progname=$1
  options=$2
  shift 2
  args=$*

  $progname $options $args 2>&1 | \
    while read -r line;do
      okay-msg "$line"
    done
}

# stow actions
__stow() {
  opt=$1
  arg=$2
  
  dot_packages=(
    bin
    home
    nvim
    tmux
    zsh
  )

  case $arg in
    *-dir=*)
      dir=$(echo "$arg" | cut -d"=" -f2)
      __read_lines "stow" "$opt" "$HOME/"  "$dir"
      ;;
    *-all)
      for dir in "${dot_packages[@]}"; do
        __read_lines "stow" "$opt" "$HOME/"  "$dir"
      done
      ;;
  esac
}

# Void Linux XBPS only
void_packages=(
  git
  stow
  curl
  wget
  zsh
  tmux
  neovim
  python-neovim
  python3-neovim
)

__install_deps() {
  sudo xbps-install -Sy "${void_packages[@]}" | {
    read -r -d "\0" -t 0.01 error
      if [[ $error =~ "Unable to locate" ]]; then
        fail-msg "Error: ${error}"
      fi
      okay-msg "deps: successfully installed."
  }
}

if [[ $(type git) =~ not\ found ]]; then
  fail-msg "git not found."
fi

cmd=$1
case "$cmd" in
  --logo)
    __print_logo
    ;;
  --all)
    __clone_dotfiles
    __install_antibody
    __install_tpm
    __install_asdf
    __install_asdf_plugin "asdf-vm/asdf-ruby" "ruby"
    __install_asdf_lang "ruby" "$RUBY_VERSION"
    __install_ruby_gems
    __install_asdf_plugin "kennyp/asdf-golang" "golang"
    __install_asdf_lang "golang" "$GOLANG_VERSION"
    __install_go_packs
    __install_deps

    # stow packages
    __stow -Rvt --restow-all

    columns=$(stty size | awk '{print $2}')
    seq -s= "$columns"|tr -d '[:digit:]'
    echo
    __print_logo
    ;;
  --dotfiles)
    __clone_dotfiles
    ;;
  --antibody)
    __install_antibody
    ;;
  --tpm)
    __install_tpm
    ;;
  --asdf)
    __install_asdf
    ;;
  --asdf-plug-ruby)
    __install_asdf_plugin "asdf-vm/asdf-ruby" "ruby"
    ;;
  --ruby-bin)
    __install_asdf_lang "ruby" "$RUBY_VERSION"
    ;;
  --ruby-gems)
    __install_ruby_gems
    ;;
  --devruby)
    __install_asdf_plugin "asdf-vm/asdf-ruby" "ruby"
    __install_asdf_lang "ruby" "$RUBY_VERSION"
    __install_ruby_gems
    ;;
  --asdf-plug-go)
    __install_asdf_plugin "kennyp/asdf-golang" "golang"
    ;;
  --go-bin)
    __install_asdf_lang "golang" "$GOLANG_VERSION"
    ;;
  --go-packs)
    __install_go_packs
    ;;
  --devgo)
    __install_asdf_plugin "kennyp/asdf-golang" "golang"
    __install_asdf_lang "golang" "$GOLANG_VERSION"
    __install_go_packs
    ;;
  --stow-dir=*)
    __stow -vt "$cmd"
    ;;
  --stow-all)
    __stow -vt "$cmd"
    ;;
  --restow-dir=*)
    __stow -Rvt "$cmd"
    ;;
  --restow-all)
    __stow -Rvt "$cmd"
    ;;
  --deps)
    __install_deps
    ;;
  *)
    echo "nothing to do"
    exit 1
    ;;
esac
