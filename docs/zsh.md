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
|[`sindresorhus/pure`][]|fast zsh prompt - needs to [`mafredri/zsh-async`][]|
|[`zsh-users/zsh-completions`][]|additional completion definitions for zsh|
|[`zsh-users/zsh-autosuggestions`][]|fish-like autosuggestions for zsh|
|[`zsh-users/zsh-history-substring-search`][]|history search feature for zsh|
|[`sinetoami/vi-mode`][]|enable vim-like mode for zsh|
|[`supercrabtree/k`][]|new `l` command with color and some git status|

### zsh commands
|command|description|
|---|---|
|`ain`|simple way to install antibody|
|`abp`|antibody bundle plugins|
|`aup`|antibody update|
|---|---|
|`ggc`|generate a `.gitconfig` file|
|`gco`|display a `fzf` branches/tags list to `git checkout`|
|`gbr`|display a `fzf` branches list|
|`gbd`|display a `fzf` branches list to `git branch -D`|
|`gtg`|display a `fzf` tags list|
|`gtd`|display a `fzf` tags list to `git tag -d`|
|`ghi`|shows all issues from a GitHub repository|
|`hub`|command to create and delete a repository, send a PR to a GitHub repository|
|---|---|
|`esc`|switch `normal` and `insert` vim like mode|
|`esc + v`|in `normal` start editor mode|
|---|---|
|`alt-c`|run `fzf` to `cd` into a selected directory|
|`ctrl-t`|run `fzf` current directory list files|
|`ctrl-r`|run `fzf` command history|

---
[dotfiles]: https://github.com/sinetoami/dotfiles
[zsh]: http://zsh.org
[antibody]: https://getantibody.github.io
[fzf]: https://github.com/junegunn/fzf
[`ripgrep`]: https://github.com/BurntSushi/ripgrep
[`bat`]: https://github.com/sharkdp/bat
[`hub`]: https://github.com/github/hub
[`ghi`]: https://github.com/stephencelis/ghi 
[`sindresorhus/pure`]: https://github.com/sindresorhus
[`mafredri/zsh-async`]: https://github.com/mafredri/zsh-async
[`zsh-users/zsh-completions`]: https://github.com/zsh-users/zsh-completions
[`zsh-users/zsh-autosuggestions`]: https://github.com/zsh-users/zsh-autosuggestions
[`zsh-users/zsh-history-substring-search`]: https://github.com/zsh-users/zsh-history-substring-search
[`sinetoami/vi-mode`]: https://github.com/sinetoami/vi-mode
[`supercrabtree/k`]: https://github.com/supercrabtree/k
