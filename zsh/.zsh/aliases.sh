#!/usr/bin/env sh
## pacman/yay
alias pacss='sudo pacman-fzf' # pacman -Ss
alias pacrm='sudo pacman -Rscn'
alias pacinf='sudo pacman-fzf -S' # pacman -S
alias yass='yay-fzf' # yay -Ss
alias yainf='yay-fzf -S' # yay -S

## gitlab cli
[[ ! $(echo $TERM) =~ xterm-256color ]] && alias lab='TERM="xterm-256color" lab' || alias lab='lab'

## asdf
alias lmin="asdf-lmi-fzf"
alias lmun="asdf-lmc-fzf"
alias lmls="asdf list"
alias lmgl="asdf global"
alias lmlo="asdf local"
alias lmcu="asdf current"
alias lmpls="asdf plugin-list"
alias lmpla="asdf plugin-list-all"
alias lmpin="asdf-lmpi-fzf"
alias lmpun="asdf-lmpc-fzf"
alias lmpup="asdf plugin-update"
alias lmpup!="asdf plugin-update --all"
alias reshim="asdf reshim"
alias asdfup="asdf update"

## golang
alias gomo='GO111MODULE=on go' # [go] [m]odule [o]n
alias gotest='go test ./... -json -cover | tparse -all -notests' # needs github.com/mfridman/tparse
alias gobench='go test -bench=.'

## pipe shortcuts
alias -g fzfp=' | fzf '
alias -g fzyp=' | fzy '

## misc
alias kp='kill-process-fzf'
alias cat='bat'
alias nvgit='nvim-git-fzf'
alias sozshrc="source $HOME/.zshrc"
alias meminfo="sudo dmidecode --type 17"
alias meminfo5="sudo dmidecode --type 5"
alias cpuinfo="sudo dmidecode --type 4"
alias pcinfo="sudo dmidecode --type 1"
alias pcinfo2="sudo dmidecode --type 2"
alias lzd="lazydocker"
