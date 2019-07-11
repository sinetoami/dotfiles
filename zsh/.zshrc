HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

## The following lines were added by compinstall
autoload -Uz compinit
compinit

## Load Environment
for file in ~/.zsh/*; do
	source $file
done

## Antibody
source $HOME/.antibody.sh

export PURI_PROMPT_LANGS=( ruby )

## fzf
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=40
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!*.git"'
export FZF_DEFAULT_OPTS='--layout=reverse'
export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers,changes --color always {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:$HOME/.bin
