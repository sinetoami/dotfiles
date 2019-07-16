---
This reference was made for my personal [dotfiles][].
title: zsh
category: zsh,commands,plugins
updated: 2019-03-07
intro: |
[zsh][] is a very advanced and programmable command interpreter. 
---

Getting Started
---------------
### 1. Requirements
- [zsh][] - command interpreter.
- [antibody][] - plugin manager for zsh.
- [fzf][] - general-purpose command-line fuzzy finder.
- [fzy][] - fuzzy text selector finder for the terminal.
- [yay][] - an AUR helper written in Go.

### 2. Install Antibody
```bash
curl -sFL git.io/antibody | sh -s - -b /usr/local/bin
```

### 3. Install FZF
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
```
Obs.: needs to install [`ripgrep`][] for my personal settings.

Shortcuts, Commands and Plugins
-------------------------------
### extra arch linux packages
|package|description|
|---|---|
|[`bat`][]|cat clone with syntax highlighting|
|[`hub`][]|a command-line tool to use git with GitHub|
|[`ghi`][]|GitHub issues on the command line|

### antibody plugins
|plugin|description|
|---|---|
|[sindresorhus/pure][]|fast zsh prompt - needs to [mafredri/zsh-async][]|
|[zsh-users/zsh-completions][]|additional completion definitions for zsh|
|[zsh-users/zsh-autosuggestions][]|fish-like autosuggestions for zsh|
|[sinetoami/vi-mode][]|enable vim-like mode for zsh|
|[supercrabtree/k][]|new `l` command with color and some git status|

### zsh commands
|command|description|
|---|---|
|`ain`|simple way to install antibody|
|`abp`|antibody bundle plugins|
|`aup`|antibody update|
|---|---|
|`ggc`|generate a `.gitconfig` file|
|`gbli`|display a `fzy` list with local git branches|
|`gba`|display a `fzy` list with all git branches|
|`gbr`|display a `fzy` list with git remote branches|
|`gco`|display a `fzy` list of all branches to `git checkout`|
|`gbd`|display a `fzy` branch list to `git branch -d`|
|`gbD`|display a `fzy` branch list to `git branch -D`|
|`gtl`|display a `fzy` tags list|
|`gtd`|display a `fzy` tags list to `git tag -d`|
|---|---|
|`gbap`|display a `fzf` branch list with git commits preview|
|`gbdm`|display a `fzf` branch list to `git branch -d` multiple branches|
|`gbDm`|display a `fzf` branch list to `git branch -D` multiple branches|
|`gcop`|display a `fzf` list with all branches and tags to `git checkout`|
|`gtlp`|display a `fzf` list of tags with git commits preview|
|`gtdm`|dispĺay a `fzf` list of tags to `git tag -d` multiple tags|
|---|---|
|`ghi`|shows all issues from a GitHub repository|
|`hub`|command to create and delete a repository, send a PR to a GitHub repository|
|---|---|
|`ESC`|switch `normal` and `insert` vim like mode|
|`ESC + v`|in `normal` start editor mode|
|---|---|
|`Ctrl + t`|run `fzf` current directory list files|
|`Ctrl + r`|run `fzf` command history|
|`Alt + c`|run `fzf` to `cd` into a selected directory|
|--|--|
|`pacinf`|run `fzf` with `pacman -Sl` command to install packages|
|`pacss`|run `fzf` with `pacma -Sl` command to search a package|
|`yainf`|run `fzf` with `yay -Sl` command to install packages|
|`yass`|run `fzf` with `yay -Sl` command to search a package|
|---|---|
|`kp`|run `fzf` to kill process|

[dotfiles]: https://github.com/sinetoami/dotfiles
[zsh]: http://zsh.org
[antibody]: https://getantibody.github.io
[fzf]: https://github.com/junegunn/fzf
[fzy]: https://github.com/jhawthorn/fzy
[yay]: https://github.com/Jguer/yay
[`ripgrep`]: https://github.com/BurntSushi/ripgrep
[`bat`]: https://github.com/sharkdp/bat
[`hub`]: https://github.com/github/hub
[`ghi`]: https://github.com/stephencelis/ghi 
[sindresorhus/pure]: https://github.com/sindresorhus
[mafredri/zsh-async]: https://github.com/mafredri/zsh-async
[zsh-users/zsh-completions]: https://github.com/zsh-users/zsh-completions
[zsh-users/zsh-autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions
[sinetoami/vi-mode]: https://github.com/sinetoami/vi-mode
[supercrabtree/k]: https://github.com/supercrabtree/k
