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
| plugin                                | description                                                                                        |
| ---                                   | ---                                                                                                |
| [Shougo/dein.vim][]                   | Dark powered Vim/Neovim plugin manager.                                                            |
| [tpope/vim-fugitive][]                | A Git wrapper so awesome, it should be illegal                                                     |
| [airblade/vim-gitgutter][]            | A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes (partial) hunks. |
| [junegunn/gv.vim][]                   | A git commit browser in Vim.                                                                       |
| [sodapopcan/vim-twiggy][]             | Git branch management for Vim.                                                                     |
| [itchyny/lightline.vim][]             | A light and configurable statusline/tabline plugin for Vim.                                        |
| [mengelbrecht/lightline-bufferline][] | A lightweight plugin to display the list of buffers in the lightline vim plugin.                   |
| [sinetoami/lightline-hunks][]         | Git hunks and git branch indicators for Lightline vim plugin.                                      |
| [sinetoami/dimfocus.vim][]            | A simple way to dim a inactive window.                                                             |
| [duggiefresh/vim-easydir][]           | A simple way to create, edit and save files and parent directories.                                |
| [tpope/vim-eunuch][]                  | Helpers for UNIX.                                                                                  |
| [tpope/vim-scriptease][]              | A Vim plugin for Vim plugins.                                                                      |
| [thaerkh/vim-workspace][]             | Automated Vim session management with file auto-save and persistent undo history.                  |
| [simeji/winresizer][]                 | Very simple vim plugin for easy resizing of your vim windows.                                      |
| [christoomey/vim-tmux-navigator][]    | Seamless navigation between tmux panes and vim splits.                                             |
| [wesQ3/vim-windowswap][]              | Swap your windows without ruining your layout.                                                     |
| [dhruvasagar/vim-zoom][]              | Toggle zoom in / out individual windows (splits).                                                  |
| [junegunn/fzf.vim][]                  | Things you can do with fzf and Vim.                                                                |
| [sinetoami/fzy.nvim][]                | Allows to use fzy fuzzy finder integrated with Neovim.                                             |
| [neoclide/coc.nvim][]                 | Intellisense engine for vim8 & neovim, full language server protocol support as VSCode.            |
| [SirVer/ultisnips][]                  | The ultimate snippet solution for Vim.                                                             |
| [honza/vim-snippets][]                | This repository contains snippets files for various programming languages.                         |
| [jiangmiao/auto-pairs][]              | Vim plugin, insert or delete brackets, parens, quotes in pair.                                     |
| [tmhedberg/matchit][]                 | Extended % matching for HTML, LaTeX, and many other languages.                                     |
| [tpope/vim-endwise][]                 | Wisely add "end" in ruby, endfunction/endif/more in vim script, etc.                               |
| [tpope/vim-commentary][]              | Comment stuff out.                                                                                 |
| [tpope/vim-surround][]                | Quoting/parenthesizing made simple.                                                                |
| [matze/vim-move][]                    | Plugin to move lines and selections up and down.                                                   |
| [kana/vim-textobj-user][]             | Create your own text objects.                                                                      |
| [kana/vim-textobj-line][]             | Text objects for the current line.                                                                 |
| [thinca/vim-textobj-between][]        | Text objects for a range between a character.                                                      |
| [AndrewRadev/switch.vim][]            | A simple Vim plugin to switch segments of text with predefined replacements.                       |
| [AndrewRadev/splitjoin.vim][]         | A vim plugin that simplifies the transition between multiline and single-line code.                |
| [mattn/emmet-vim][]                   | Emmet for vim.                                                                                     |
| [terryma/vim-multiple-cursors][]      | True Sublime Text style multiple selections for Vim.                                               |
| [benmills/vimux][]                    | Vim plugin to interact with tmux.                                                                  |
| [janko/vim-test][]                    | Run your tests at the speed of thought.                                                            |
| [KabbAmine/zeavim.vim][]              | Zeal for Vim.                                                                                      |
| [fatih/vim-go][]                      | Go development plugin for Vim.                                                                     |
| [sebdah/vim-delve][]                  | Neovim / Vim integration for Delve.                                                                |
| [benmills/vimux-golang][]             | Run golang tests using vimux.                                                                      |
| [vim-ruby/vim-ruby][]                 | Vim/Ruby Configuration Files.                                                                      |
| [tpope/vim-rake][]                    | It's like rails.vim without the rails.                                                             |
| [tpope/gem-ctags][]                   | Automatic ctags generation on gem install.                                                         |
| [tpope/vim-bundler][]                 | Lightweight support for Ruby's Bundler.                                                            |
| [nelstrom/vim-textobj-rubyblock][]    | A custom text object for selecting ruby blocks.                                                    |
| [hmarr/vim-gemfile][]                 | A faster way of adding gems to your Gemfiles.                                                      |
| [tpope/vim-markdown][]                | Vim Markdown runtime files.                                                                        |
| [sinetoami/sinokai.vim][]             | My personal theme color for vim. Based on [`Monokai Pro`][].                                       |
| [godlygeek/tabular][]                 | Vim script for text filtering and alignment.                                                       |

### dein commands
For mode details see `:help dein`.

| command        | description                     |
| ---            | ---                             |
| `:DeinInstall` | install vim plugins             |
| `:DeinUpdate`  | update vim plugins              |
| `:DeinCleanUp` | remove all disabled vim plugins |
- Note1: [dein-ui.vim][] allows tu use `SPInstall` and `:DeinUpdate` over the
`dein#install()` and `dein#update()` commands respectively.
- Note2: `:DeinCleanUp` needs to `s:dein_cleanup()` to works. See `06-pluginsc.vim` file.

### fzf commands
For more details see `:help fzf` and `:help fzf-vim`.

| command    | description                                      |
| ---        | ---                                              |
| `Ctrl + p` | list local files                                 |
| `Ctrl + b` | list local buffers                               |
| `TAB`      | multiple selections                              |
| `Ctrl + t` | open a selected file in new `tab`                |
| `Ctrl + x` | open a selected file in a new `horizontal` split |
| `Ctrl + v` | open a selected file in a new `vertical` split   |
| `ffd`      | `rg` finder                                      |
| `fd!`      | `rg` finder with fullscreen preview              |
| `fbl`      | lines in the current buffer                      |
| `fgf`      | git files under `git ls-files` tree              |
| `fgs`      | git files status (like fugitive  `:Gstatus`)     |
| `fgc`      | git commits                                      |
| `fhelp`    | nvim help tags (like vim `:help`)                |

### fzy commands
| command        | description                                      |
| ---            | ---                                              |
| `Ctrl-Alt + p` | list local files                                 |
| `Ctrl + t`     | open a selected file in new `tab`                |
| `Ctrl + x`     | open a selected file in a new `horizontal` split |
| `Ctrl + v`     | open a selected file in a new `vertical` split   |

### fugitive commands
For more details see `:help fugitive`.

| command | description                                         |
| ---     | ---                                                 |
| `,gaa`  | git add all changes                                 |
| `,gcs`  | git commit with `-S` flag                           |
| `,gca`  | git commit with `--amend` flag - also `-S` flag too |
| `,gst`  | git status                                          |
| `,gdf`  | git diff in a `vertival` split                      |
| `,gbl`  | git blame                                           |

### twiggy command
For more details see `:help twiggy`.

| command | description                                         |
| ---     | ---                                                 |
| `,gbr`  | git branch - shows all branches                     |
| `,gcm`  | git checkout master                                 |
| `,gnb`  | git checkout with `-b` flag                         |

### coc.nvim command
For more details see `:help coc-nvim.txt`.

| command     | description                                                     |
| ---         | ---                                                             |
| `:Format`   | format current buffer                                           |
| `,f`        | format current selection                                        |
| `]c`        | next diagnostic                                                 |
| `[c`        | previous diagnostic                                             |
| `crn`       | rename a symbol(variables, etc) under the cursor                |
| `,qf`       | try to run quickfix action for diagnostics on the current line. |
| ---         | ---                                                             |
| `[V]Ctrl-c` | multiple cursors for the selected word                          |
| `Ctrl-l`    | expand snippet/completion selection                             |
| `Ctrl-p`    | previous snippet/completion selection                           |
| `Ctrl-n`    | next snippet/completion selection                               |

### vim-test commands
For more details see `:help test`.

| command      | description                                  |
| ---          | ---                                          |
| `t + Ctrl-n` | run nearest test to the cursor               |
| `t + Ctrl-f` | run current test file                        |
| `t + Ctrl-s` | run test suite                               |
| `t + Ctrl-l` | run last test                                |
| `t + Ctrl-g` | open the last run test in the current buffer |

### miscellaneous commands
| command         | description                                     |
| ---             | ---                                             |
| `Alt + w`       | close a buffer                                  |
| `Alt + a`       | move to the previous buffer - `[a]nterior`      |
| `Alt + s`       | move to the next buffer - `[s]eguinte`          |
| `,[N]`          | select buffer by `[N]umber` - 1 to 0            |
| `,hs`           | open a horizontal split                         |
| `,vs`           | open a vertical split                           |
| `Ctrl-e + h`    | resize window to the left hand                  |
| `Ctrl-e + l`    | resize window to the right hand                 |
| `Ctrl-e + k`    | resize window to the top                        |
| `Ctrl-e + j`    | resize window to the bottom                     |
| `Ctrl-w + m`    | toggle zoom in/out individual split             |
| ---             | ---                                             |
| `..`            | path of current file                            |
| `.%`            | full path to current file                       |
| `:Ctrl + p`     | path of current file                            |
| `:Ctrl-Alt + p` | full path to current file                       |
| `,cn`           | cycle `set number` mode                         |
| `AltGr-/`       | toggle `:nohlsearch`                            |
| `F2`            | toggle paste mode                               |
| ---             | ---                                             |
| `\`             | *backslash* toogle current fold                 |
| `,\`            | toggle recursively current fold                 |
| `,/`            | close all folds except the one under the cursor |
| `Alt + /`       | open all folds                                  |
| `Alt + '-'`     | close all folds                                 |
| ---             | ---                                             |
| `Alt + \`       | comment line(s) with `vim-commentary`           |

[dotfiles]: https://github.com/sinetoami/dotfiles
[neovim]: https://neovim.io
[Shougo/dein.vim]: https://github.com/Shougo/dein.vim
[tpope/vim-fugitive]: https://github.com/tpope/vim-fugitive
[airblade/vim-gitgutter]: https://github.com/airblade/vim-gitgutter
[junegunn/gv.vim]: https://github.com/junegunn/gv.vim
[sodapopcan/vim-twiggy]: https://github.com/sodapopcan/vim-twiggy
[itchyny/lightline.vim]: https://github.com/itchyny/lightline.vim
[mengelbrecht/lightline-bufferline]: https://github.com/mengelbrecht/lightline-bufferline
[sinetoami/lightline-hunks]: https://github.com/sinetoami/lightline-hunks
[sinetoami/dimfocus.vim]: https://github.com/sinetoami/dimfocus.vim
[duggiefresh/vim-easydir]: https://github.com/duggiefresh/vim-easydir
[tpope/vim-eunuch]: https://github.com/tpope/vim-eunuch
[tpope/vim-scriptease]: https://github.com/tpope/vim-scriptease
[thaerkh/vim-workspace]: https://github.com/thaerkh/vim-workspace
[simeji/winresizer]: https://github.com/simeji/winresizer
[christoomey/vim-tmux-navigator]: https://github.com/christoomey/vim-tmux-navigator
[wesQ3/vim-windowswa]: https://github.com/wesQ3/vim-windowswa
[dhruvasagar/vim-zoom]: https://github.com/dhruvasagar/vim-zoom
[junegunn/fzf.vim]: https://github.com/junegunn/fzf.vim
[sinetoami/fzy.nvim]: https://github.com/sinetoami/fzy.nvim
[neoclide/coc.nvim]: https://github.com/neoclide/coc.nvim
[SirVer/ultisnips]: https://github.com/SirVer/ultisnips
[honza/vim-snippets]: https://github.com/honza/vim-snippets
[jiangmiao/auto-pairs]: https://github.com/jiangmiao/auto-pairs
[tmhedberg/matchit]: https://github.com/tmhedberg/matchit
[tpope/vim-endwise]: https://github.com/tpope/vim-endwise
[tpope/vim-commentary]: https://github.com/tpope/vim-commentary
[tpope/vim-surround]: https://github.com/tpope/vim-surround
[matze/vim-move]: https://github.com/matze/vim-move
[kana/vim-textobj-user]: https://github.com/kana/vim-textobj-user
[kana/vim-textobj-line]: https://github.com/kana/vim-textobj-line
[thinca/vim-textobj-between]: https://github.com/thinca/vim-textobj-between
[AndrewRadev/switch.vim]: https://github.com/AndrewRadev/switch.vim
[AndrewRadev/splitjoin.vim]: https://github.com/AndrewRadev/splitjoin.vim
[mattn/emmet-vim]: https://github.com/mattn/emmet-vim
[terryma/vim-multiple-cursors]: https://github.com/terryma/vim-multiple-cursors
[bemills/vimux]: https://github.com/bemills/vimux
[janko/vim-test]: https://github.com/janko/vim-test
[KabbAmine/zeavim.vim]: https://github.com/KabbAmine/zeavim.vim
[fatih/vim-go]: https://github.com/fatih/vim-go
[sebdah/vim-delve]: https://github.com/sebdah/vim-delve
[benmills/vimux-golang]: https://github.com/benmills/vimux-golang
[vim-ruby/vim-ruby]: https://github.com/vim-ruby/vim-ruby
[tpope/vim-rake]: https://github.com/tpope/vim-rake
[tpope/gem-ctags]: https://github.com/tpope/gem-ctags
[tpope/vim-bundler]: https://github.com/tpope/vim-bundler
[nelstrom/vim-textobj-rubyblock]: https://github.com/nelstrom/vim-textobj-rubyblock
[hmarr/vim-gemfile]: https://github.com/hmarr/vim-gemfile
[tpope/vim-markdown]: https://github.com/tpope/vim-markdown
[sinetoami/sinokai.vim]: https://github.com/sinetoami/sinokai.vim
[godlygeekq/tabular]: https://github.com/godlygeekq/tabular
[wsdjeg/dein-ui.vim]: https://github.com/wsdjeg/dein-ui.vim
[1]: https://github.com/1
[1]: https://github.com/1
[`Monokai Pro`]: https://monokai.pro/
