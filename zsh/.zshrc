# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### powerlevel10k prompt
# source ~/.powerlevel10k/powerlevel10k.zsh-theme
# source ~/.p10k.zsh

export ZSH=$HOME/.zsh
HISTFILE=~/.zsh_history
HISTSIZE=80000
SAVEHIST=80000
HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g"

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
source ~/.zsh_plugins.zsh

## FZF completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Finalize Powerlevel10k instant prompt. Should stay at the bottom of ~/.zshrc.
(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
