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
| plugin                                    | description                                            |
| ---                                       | ---                                                    |
| [tmux-plugins/tpm][]                      | tmux plugin manager                                    |
| [christoomey/vim-tmux-navigator][]        | enable navigation between tmux panes and vim splits    |
| [tmux-plugins/tmux-copycat][]             | enhances tmux search                                   |
| [tmux-plugins/tmux-yank][]                | copy to the system clipboard in tmux                   |
| [tmux-plugins/tmux-open][]                | open highlighted selection                             |
| [tmux-plugins/tmux-urlview][]             | open urls                                              |
| [nhdaly/tmux-better-mouse-mode]           | a tmux plugin to better manage and configure the mouse |
| [tmux-plugins/tmux-prefix-highlight][]    | show the prefix highlighted when press it              |
| [kristijanhusak/tmux-simple-git-status][] | shows git status tmux statusbar                        |

### tmux commands
| command            | description                          |
| ---                | ---                                  |
| `Ctrl + a`         | prefix                               |
| `Ctrl + c`         | create a new session                 |
| `prefix + m`       | toggle mouse mode                    |
| ---                | ---                                  |
| `prefix + Enter`   | enter copy mode                      |
| `[CPM] Shift + l`  | go at the end-of-line                |
| `[CPM] Shift + h`  | go at the start-of-line              |
| `[CPM] + v`        | enter select mode                    |
| `[CPM] + Ctrl+v`   | enter select-line mode               |
| `[CPM] + y`        | yank current selection               |
| ---                | ---                                  |
| `prefix + /`       | vertical split pane                  |
| `prefix + -`       | horizontal split pane                |
| `prefix + >`       | swap current pane with next one      |
| `prefix + <`       | swap current pane with previous one  |
| `prefix + Shift+h` | resize pane to the `h (left)`        |
| `prefix + Shift+j` | resize pane to the `j (down)`        |
| `prefix + Shift+k` | resize pane to `k (up)`              |
| `prefix + Shift+l` | resize pane to `l (right)`           |
| ---                | ---                                  |
| `prefix + c`       | create a new window                  |
| `Alt + [N]`        | switch to window `[N]umber` - 1 to 0 |
| `prefix + l`       | select next window                   |
| `prefix + h`       | select previous window               |
| `prefix + Tab`     | move to last active window           |
Note1: `[CPM]` means `CopyMode`.

[dotfiles]: https://github.com/sinetoami/dotfiles
[zsh]: http://zsh.org
[tmux]: https://github.com/tmux/tmux
[tmux-plugins/tpm]: https://github.com/tmux-plugins/tpm
[christoomey/vim-tmux-navigator]: https://github.com/tmux-plugins/vim-tmux-navigator
[tmux-plugins/tmux-resurrect]: https://github.com/tmux-plugins/tmux-resurrect
[tmux-plugins/tmux-continuum]: https://github.com/tmux-plugins/tmux-continuum
[tmux-plugins/tmux-capycat]: https://github.com/tmux-plugins/tmux-copycat
[tmux-plugins/tmux-yank]: https://github.com/tmux-plugins/tmux-yank
[tmux-plugins/tmux-open]: https://github.com/tmux-plugins/tmux-open
[tmux-plugins/tmux-urlview]: https://github.com/tmux-plugins/tmux-urlview
[nhdaly/tmux-better-mouse-mode]: https://github.com/NHDaly/tmux-better-mouse-mode
[tmux-plugins/tmux-prefix-highlight]: https://github.com/tmux-plugins/tmux-prefix-highlight
[kristijanhusak/tmux-simple-git-status]: https://github.com/tmux-plugins/tmux-simple-git-status
