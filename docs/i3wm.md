---
This reference was made for my personal [dotfiles][].
title: neovim
category: i3wm,commands,plugins
updated: 2019-03-07
intro: |
[i3wm][] is hyperextensible Vim-based text editor. 
---

Getting Started
---------------
### Requirements
[i3-gaps][] - a fork of [i3wm][] with additional features.
[py3status][] - extension for `i3bar`.
[rofi][] - a window switcher, application launcher and dmenu replacement.

Shortcuts, Commands and Plugins
-------------------------------
| command            | description                               |
| ---                | ---                                       |
| `Win + Enter`      | start a new terminal                      |
| `Win + d`          | start `rofi`                              |
| `Win-Shift + r`    | restart i3wm                              |
| `Win-Shift + c`    | reload i3wm config                        |
| `Win-Shift + e`    | ask to exist                              |
| `Win-Ctrl + l`     | start lockscreen                          |
| `Win-Shift + q`    | kill a current window                     |
| `Alt + Tab`        | move focus to the right hand window       |
| `Alt-Shigt + Tab`  | move focus to the left hand windo         |
| `Alt-Ctrl + right` | go to next workspace                      |
| `Alt-Ctrl + left`  | go to previous workspace                  |
| `Win-Shift-t`      | set internal gaps around each window      |
| `Win-Shift-d`      | unset internal gaps around each window    |
| `Win + s`          | increase internal gaps around each window |
| `Win-Shift + s`    | decrease internal gaps around each window |
| `Win + z`          | increase external gaps around all windows |
| `Win-Shift + z`    | decrease external gaps around all windows |

---
[dotfiles]: https://github.com/sinetoami/dotfiles
[i3wm]: https://i3wm.org
[i3-gaps]: https//github.com/Airblader/i3
[py3status]: https://py3status.readthedocs.io/en/latest/index.html
[rofi]: https://github.com/davatorium/rofi 
