---
This reference was made for my personal [dotfiles][].
title: tmux
category: tmux,commands,plugins
updated: 2019-03-07
intro: |
[tmux][] is a terminal multiplexer. 
---

Getting Started
---------------
### 1. Requirements
- [zsh][] - command interpreter.
- [tmux][] - terminal multiplexer.

Shortcuts, Commands and Plugins
-------------------------------
### tmux plugins
|plugin|description|
|---|---|
|[`tmux-plugins/tpm`][]|tmux plugin manager|
|[`tmux-plugins/tmux-yank`][]|copy to the system clipboard in tmux|
|[`tmux-plugins/tmux-copycat`][]|enhances tmux search|
|[`tmux-plugins/tmux-open`][]|open highlighted selection|
|[`tmux-plugins/tmux-urlview`][]|open urls|
|[`tmux-plugins/tmux-prefix-highlight`][]|show the prefix highlighted when press it|
|[`christoomey/vim-tmux-navigator`][]|enable navigation between tmux panes and vim splits|
|[`kristijanhusak/tmux-simple-git-status`][]|shows git status tmux statusbar|

### tmux commands
|command|description|
|---|---|
|`ctrl-a`|prefix|
|`ctrl-c`|create a new session|
|`prefix + m`|toggle mouse mode|
|---|---|
|`prefix + Enter`|enter copy mode|
|`[Copy Mode] shift-l`|go at the end-of-line|
|`[Copy Mode] shift-h`|go at the start-of-line|
|`[Copy Mode] + v`|enter select mode|
|`[Copy Mode] + ctrl-v`|enter select-line mode|
|`[Copy Mode] + y`|yank current selection|
|---|---|
|`prefix + /`|vertical split pane|
|`prefix + -`|horizontal split pane|
|`prefix + >`|swap current pane with next one|
|`prefix + <`|swap current pane with previous one|
|`prefix + shift-[h,j,k,l]`|resize pane to `h (left), j (down), k (up), l (right)`|
|---|---|
|`prefix + c`|create a new window|
|`alt-[1..0]`|switch window to `[1],[2],[3]..[0]`|
|`prefix + l`|select next window|
|`prefix + h`|select previous window|
|`prefix + Tab`|move to last active window|

---
[dotfiles]: https://github.com/sinetoami/dotfiles
[zsh]: http://zsh.org
[tmux]: https://github.com/tmux/tmux
[`tmux-plugins/tpm`]: https://github.com/tmux-plugins/tpm
[`tmux-plugins/tmux-yank`]: https://github.com/tmux-plugins/tmux-yank
[`tmux-plugins/tmux-capycat`]: https://github.com/tmux-plugins/tmux-copycat
[`tmux-plugins/tmux-open`]: https://github.com/tmux-plugins/tmux-open
[`tmux-plugins/tmux-urlview`]: https://github.com/tmux-plugins/tmux-urlview
[`tmux-plugins/tmux-prefix-highlight`]: https://github.com/tmux-plugins/tmux-prefix-highlight
[`christoomey/vim-tmux-navigator`]: https://github.com/tmux-plugins/vim-tmux-navigator
[`kristijanhusak/tmux-simple-git-status`]: https://github.com/tmux-plugins/tmux-simple-git-status
