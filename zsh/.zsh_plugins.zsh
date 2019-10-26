## oh-my-zsh plugins
autoload -Uz compinit
compinit

## local sources
zplugin ice atload"fpath+=( \$PWD );"
zplugin light $ZSH/completions

zplugin ice atinit'local i; for i in *.sh; do source $i; done';
zplugin light $ZSH

## OMZ libraries
local _ZSHRC_OMZ_LIBS=(
	compfix.zsh
	completion.zsh
	directories.zsh
	functions.zsh
	grep.zsh
	history.zsh
	key-bindings.zsh
	misc.zsh
	spectrum.zsh
	termsupport.zsh
	theme-and-appearance.zsh
)

zplugin ice from"gh" pick"lib/git.zsh" nocompletions blockf \
	atload'!local f; for f in ${_ZSHRC_OMZ_LIBS}; do source lib/$f; done' \
	compile"lib/(${(j.|.)_ZSHRC_OMZ_LIBS})"

zplugin load robbyrussell/oh-my-zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/vscode/vscode.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zplugin snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
zplugin snippet OMZ::plugins/golang/golang.plugin.zsh

## completions
zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-autosuggestions

## misc
zplugin light zdharma/fast-syntax-highlighting
zplugin light sinetoami/vi-mode
zplugin light supercrabtree/k
zplugin light rupa/z
zplugin light changyuheng/fz
zplugin light hlissner/zsh-autopair

## powerlevel10k prompt
# zplugin ice wait'!' lucid atload'source ~/.p10k.zsh; _p9k_precmd' nocd
zplugin ice depth=1 atload'source ~/.p10k.zsh'
zplugin light romkatv/powerlevel10k

## pure prompt
# zplugin ice pick"async.zsh" src"pure.zsh"
# zplugin light sindresorhus/pure

## zinc prompt
# zplugin ice atload'source ~/.purezinc' lucid
# zplugin light robobenklein/zinc
