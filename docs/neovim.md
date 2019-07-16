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
- [neovim][] >= v0.3.7

### Providers
```bash
"" Python3
sudo pacman -S neovim python-neovim python-pip
pip3 install --user --upgrade pynvim

"" Python2
sudo pacman -S python2 python2-pip
pip2 install --user --upgrade pyvim

"" Ruby
sudo pacman -S ruby
gem install neovim

"" Node.js
sudo pacman -S nodejs npm
sudo npm install -g neovim
```
See `:help provider` to enable `Python2`, `Python3`, `Ruby` and `Node.js` 
providers. After that check `:checkhealth` to see all health checks.

Shortcuts, Commands and Plugins
-------------------------------
### vim plugins
|plugin|description|
|---|---|
|[Shougo/dein.vim][]|vim plugin manager|
|[wsdjeg/dein-ui.vim][]|dein inteface like `vim-plug`|
|[itchyny/lightline.vim][]|configurable statusline/tabline|
|[mengelbrecht/lightline-bufferline][]|lightweight plugin to display the 
list of bufferline on `lightline.vim`|
|[sinetoami/lightline-hunks.vim][]|simple plugin to display git infos on 
`lightline.vim`|
|[sinetoami/lightline-dimfocus.vim][]|simple plugin to dim `lightline.vim` 
statusline/tabline to a inactive window|
|[christoomey/vim-tmux-navigator][]|navigation between tmux panes and vim 
splits|
|[junegunn/fzf.vim][]|general purpose command-line fuzzy finder for vim|
|[sinetoami/fzy.nvim][]|another fuzzy finder for vim - needs `fzy`|
|[tpope/vim-eunuch][]|gives some command lines to file manipulation|
|[tpope/vim-commentary][]|simple and smarter commenter for programming 
code|
|[sheerun/vim-polyglot][]|a lot of syntax files|
|[vim-ruby/vim-ruby][]|all for ruby programming|
|[sinetoami/sinokai.vim][]|another monokai-based colorscheme inspired by 
[Monokai Pro][]|

### dein commands
For mode details see `:help dein`.

|command|description|
|---|---|
|`:call dein#install()`|install vim plugins|
|`:call dein#update()`|update vim plugins|
|`:DeinCleanUp`|remove all disabled vim plugins|
- Note1: [dein-ui.vim] allows tu use `SPInstall` and `:DeinUpdate` over the
`dein#install()` and `dein#update()` commands respectively.
- Note2: `:DeinCleanUp` needs to `s:dein_cleanup()` to works. See `06-pluginsc.vim` file.

### fzf commands
For more details see `:help fzf` and `:help fzf-vim`.

|command|description|
|---|---|
|`Ctrl + p`|list local files|
|`Ctrl + b`|list local buffers|
|`TAB`|multiple selections|
|`Ctrl + t`|open a selected file in new `tab`|
|`Ctrl + x`|open a selected file in a new `horizontal` split|
|`Ctrl + v`|open a selected file in a new `vertical` split|
|`ffd`|`rg` finder|
|`fd!`|`rg` finder with fullscreen preview|
|`fbl`|lines in the current buffer|
|`fgf`|git files under `git ls-files` tree|
|`fgs`|git files status (like fugitive  `:Gstatus`)|
|`fgc`|git commits|
|`fhelp`|nvim help tags (like vim `:help`)|

### fzy commands
|command|description|
|---|---|
|`Ctrl-Alt + p`|list local files|
|`Ctrl + t`|open a selected file in new `tab`|
|`Ctrl + x`|open a selected file in a new `horizontal` split|
|`Ctrl + v`|open a selected file in a new `vertical` split|

### fugitive commands
For more details see `:help fugitive`.

|command|description|
|---|---|
|`,gaa`|git add all changes|
|`,gcs`|git commit with `-S` flag|
|`,gca`|git commit with `--amend` flag - also `-S` flag too|
|`,gst`|git status|
|`,gdf`|git diff in a `vertival` split|
|`,gbl`|git blame|
|`,gbr`|git branch with `--list` flag|
|`,gbu`|git branch with `--remote` flag - *u* of *upstream*|
|`,gcm`|git checkout master|
|`,gnb`|git checkout with `-b` flag|

### miscellaneous commands
|---|---|
|`Alt + w`|close a buffer|
|`Alt + a`|move to the previous buffer - `[a]nterior`|
|`Alt + s`|move to the next buffer - `[s]eguinte`|
|`,[N]`|select buffer by `[N]umber` - 1 to 0|
|`,hs`|open a horizontal split|
|`,vs`|open a vertical split|
|`Shift+Alt + left`|resize window to the left hand|
|`Shift+Alt + right`|resize window to the right hand|
|`Shift+Alt + up`|resize window to the top|
|`Shift+Alt + down`|resize window to the bottom|
|---|---|
|`..`|path of current file|
|`.%`|full path to current file|
|`:Ctrl + p`|path of current file|
|`:Ctrl-Alt + p`|full path to current file|
|`,cn`|cycle `set number` mode|
|`AltGr-/`|toggle `:nohlsearch`|
|`F2`|toggle paste mode|
|---|---|
|`\`|*backslash* toogle current fold|
|`,\`|toggle recursively current fold|
|`,/`|close all folds except the one under the cursor|
|`Alt + /`|open all folds|
|`Alt + '-'`|close all folds|
|---|---|
|`Alt + \`|comment line(s) with `vim-commentary`|

[dotfiles]: https://github.com/sinetoami/dotfiles
[neovim]: https://neovim.io
[Shougo/dein.vim]: https://github.com/Shougo/dein.vim
[wsdjeg/dein-ui.vim]: https://github.com/wsdjeg/dein-ui.vim
[itchyny/lightline.vim]: https://github.com/itchyny/lightline.vim
[mengelbrecht/lightline-bufferline]: https://github.com/mengelbrecht/lightline-bufferline
[sinetoami/lightline-hunks.vim]: https://github.com/sinetoami/lightline-hunks
[sinetoami/lightline-dimfocus.vim]: https://github.com/sinetoami/lightline-dimfocus.vim
[christoomey/vim-tmux-navigator]: https://github.com/christoomey/vim-tmux-navigator
[junegunn/fzf.vim]: https://github.com/junegunn/fzf.vim
[sinetoami/fzy.nvim]: https://github.com/nannery/neovim-fuzzy
[tpope/vim-eunuch]: https://github.com/tpope/vim-eunuch
[tpope/vim-commentary]: https://github.com/tpope/vim-commentary
[sheerun/vim-polyglot]: https://github.com/sheerun/vim-polyglot
[vim-ruby/vim-ruby]: https://github.com/vim-ruby/vim-ruby
[sinetoami/sinokai.vim]: https://github.com/sinetoami/sinokai.vim
[`Monokai Pro`]: https://monokai.pro/
[``]: https://github.com/
[``]: https://github.com/
[``]: https://github.com/
[``]: https://github.com/
[``]: https://github.com/
[``]: https://github.com/

