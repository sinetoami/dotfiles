## oh-my-zsh plugins
# OMZ libraries
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
zplugin light rupa/z
zplugin light changyuheng/fz

## prompt
zplugin light mafredri/zsh-async
zplugin ice atload'source ~/.p10k-pure.zsh' lucid nocd; zplugin light romkatv/powerlevel10k
##

## misc
zplugin light zdharma/fast-syntax-highlighting
zplugin light sinetoami/vi-mode
zplugin light supercrabtree/k
