#!/usr/bin/env sh

function __pub_key_hash {
	gpg --keyid-format long --list-keys $GPG_USER_EMAIL | awk -F' ' '/^pub/ {print $2}' | awk -F'/' '{print $2}'
}

## GPG HASHKEY
export GPG_PUBKEY_HASH=$(__pub_key_hash)

## ASDF
export ASDF_DIR=$HOME/.asdf
source $ASDF_DIR/asdf.sh && source $ASDF_DIR/completions/asdf.bash

## GOLANG
export GOPATH=$HOME/.go:$HOME/Devspace/go:$HOME/Studyspace/go
export PATH=$PATH:${GOPATH//://bin:}/bin

## RUBY
export PATH=$PATH:$(ruby -e 'puts Gem.user_dir')/bin

## FZF
export FZF_TMUX=0
export FZF_TMUX_HEIGHT=40
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!*.git"'
export FZF_DEFAULT_OPTS='--height=70% --layout=reverse'
export FZF_CTRL_T_OPTS="--height=80% --preview '(bat --style=numbers,changes --color always {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--height=99% --preview 'tree -C {} | head -200'"
