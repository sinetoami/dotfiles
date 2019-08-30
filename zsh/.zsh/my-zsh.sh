#!/usr/bin/env sh
is_plugin() {
  test -f $1/plugins/$2/$2.plugin.zsh
}

## Add all my personal completions
fpath=($ZSH/completions $fpath)

## The following lines were added by compinstall
autoload -Uz compinit
compinit

## Antibody
# NOTE: make sure source antibody.sh before my personal settings
# to garantee my personal settings overrule some loaded plugin
source $HOME/.antibody.sh

## Load a source all my personal plugins
for plugin ($plugins) do
	if is_plugin $ZSH $plugin; then
		fpath=($ZSH/plugin/$plugin $fpath)
		source $ZSH/plugins/$plugin/$plugin.plugin.zsh
	fi
done

## Load Environment
for file in $files; do
	if [[ -f $ZSH/$file ]]; then
		source $ZSH/$file
	fi
done

## ssh-agent
eval `keychain --eval --quiet id_rsa`
