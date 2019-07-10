---
This reference was made for my personal [dotfiles][].
title: neovim
category: neovim,commands,plugins
updated: 2019-03-07
intro: |
[neovim][] is hyperextensible Vim-based text editor. 
---

Getting Started
---------------
### Requirements


Shortcuts, Commands and Plugins
-------------------------------
### vim plugins
|plugin|description|
|---|---|
|[`Shougo/dein.vim`][]|vim plugin manager|
|[`wsdjeg/dein-ui.vim`][]|dein inteface like `vim-plug`|
|[`itchyny/lightline.vim`][]|configurable statusline/tabline|
|[`mengelbrecht/lightline-bufferline`][]|lightweight plugin to display the 
list of buffers on lightline|
|[`sinetoami/lightline-hunks`][]|simple plugin to display git status on 
lightline|
|[`sinetoami/lightline-dimfocus.vim`][]|simple plugin to dim statusline/tablinefrom a inactive window|
|[`christoomey/vim-tmux-navigator`][]|navigation between tmux panes and vim 
splits|
|[`junegunn/fzf.vim`][]|general purpose command-line fuzzy finder for vim|
|[`nannery/neovim-fuzzy`][]|another fuzzy finder for vim - needs `fzy`|
|[`tpope/vim-eunuch`][]|gives some command lines to file manipulation|
|[`tpope/vim-commentary`][]|simple and smarter commenter for programming 
code|
|[`sheerun/vim-polyglot`][]|a lot of syntax files|
|[`vim-ruby/vim-ruby`][]|all for ruby programming|
|[`sinetoami/sinokai.vim`][]|another monokai-based colorscheme inspired by [`Monokai Pro`][]|

### editor commands
|command|description|
|---|---|
|`:call dein#install()` or `SPInstall`|install vim plugins|
|`:call dein#update()` or `DeinUpdate`|update vim plugins|
|`:DeinCleanUp`|remove all disabled vim plugins|
|---|---|
|`altgr-[a;s]`|move around buffers on bufferline|
|`,[1..0]`|select buffer by `number`|
|`alt-w`|close a buffer|
|`,hs`|open a horizontal split|
|`,vs`|open a vertical split|
|---|---|
|`,cn`|cycle `set number` mode|
|`[NORMAL]$$`|path of current file|
|`[NORMAL]$%`|full path to current file|
|`[COMMAND]ctrl-p`|path of current file|
|`[COMMAND]ctrl-alt-p`|full path to current file|
|`altgr-/`|toggle `:nohlsearch`|
|`F2`|toggle paste mode|

### fzf commands
|command|description|
|---|---|
|`Ctrl-p`|list local files|
|`Ctrl-b`|list local buffers|
|`TAB`|multiple selections|
|`Ctrl-t`|open a selected file in new `tab`|
|`Ctrl-x`|open a selected file in a new `horizontal` split|
|`Ctrl-v`|open a selected file in a new `vertical` split|
|`,fd`|`rg` grep|
|`,f!`|`rg` grep with fullscreen preview|

### fzy commands
|command|description|
|---|---|
|`Ctrl-alt-p`|list local files|
|`Ctrl-t`|open a selected file in new `tab`|
|`Ctrl-x`|open a selected file in a new `horizontal` split|
|`Ctrl-v`|open a selected file in a new `vertical` split|

---[dotfiles]: https://github.com/sinetoami/dotfiles
[neovim]: https://neovim.io
[`Shougo/dein.vim`]: https://github.com/Shougo/dein.vim
[`wsdjeg/dein-ui.vim`]: https://github.com/wsdjeg/dein-ui.vim
[`itchyny/lightline.vim`]: https://github.com/itchyny/lightline.vim
[`mengelbrecht/lightline-bufferline`]: https://github.com/mengelbrecht/lightline-bufferline
[`sinetoami/lightline-hunks`]: https://github.com/sinetoami/lightline-hunks
[`sinetoami/lightline-dimfocus.vim`]: https://github.com/sinetoami/lightline-dimfocus.vim
[`christoomey/vim-tmux-navigator`]: https://github.com/christoomey/vim-tmux-navigator
[`junegunn/fzf.vim`]: https://github.com/junegunn/fzf.vim
[`nannery/neovim-fuzzy`]: https://github.com/nannery/neovim-fuzzy
[`tpope/vim-eunuch`]: https://github.com/tpope/vim-eunuch
[`tpope/vim-commentary`]: https://github.com/tpope/vim-commentary
[`sheerun/vim-polyglot`]: https://github.com/sheerun/vim-polyglot
[`vim-ruby/vim-ruby`]: https://github.com/vim-ruby/vim-ruby
[`sinetoami/sinokai.vim`]: https://github.com/sinetoami/sinokai.vim
[`Monokai Pro`]: https://monokai.pro/
[``]: https://github.com/
[``]: https://github.com/
[``]: https://github.com/
[``]: https://github.com/
[``]: https://github.com/
[``]: https://github.com/

