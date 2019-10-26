## git
alias ggc='git-config-template' # [g]it [g]enerate [c]onfig

# git branch
alias gbli='git-branch-fzy branch --list' # [g]it [b]ranch [li]st
alias gba='git-branch-fzy branch --all' # [g]it [b]ranch [a]ll
alias gbr='git-branch-fzy branch --remote' # [g]it [b]ranch [r]emote
alias gbd='git-branch-fzy branch --all -d' # [g]it [b]ranch [d]elete
alias gbD='git-branch-fzy branch --all -D' # [g]it [b]ranch [d]elete
alias gbdm='git-branch-fzf branch --all -d' # [g]it [b]ranch [d]elete [m]ulti
alias gbDm='git-branch-fzf branch --all -D' # [g]it [b]ranch [d]elete [m]ulti
alias gbap='git-branch-fzf branch --all' # [g]it [b]ranch [d]elete [m]ulti

# git checkout
alias gcb='git checkout -b' # [g]it [c]heckout -[b]
alias gco='git-branch-fzy checkout --all' # [g]it [c]heck[o]ut
alias gcop='git-branch-fzf checkout --all' # [g]it [c]heck[o]ut with [p]review 

# git tag
alias gtl='git-branch-fzy tag --list' # [g]it [t]ag [l]ist
alias gtd='git-branch-fzy tag --all -d' # [g]it [t]ag [l]ist
alias gtlp='git-branch-fzf tag --list' # [g]it [t]ag [l]ist with [p]review
alias gtdm='git-branch-fzf tag --all -d' # [g]it [t]ag [d]elete [m]ulti

# git blame
alias gbl='git blame' # [g]it [bl]ame
alias gblbw='git blame -b -w' # [g]it [bl]ame -[b] -[w]

# git commit
alias gcs='git commit -S -v' # [g]it [c]ommit -[S]
alias gcsa='git commit -S -v -a' # [g]it [c]ommit -[S] -[a]
alias gcsm='git commit -S -m' # [g]it [c]ommit -[S] -[m]
alias gcs!='git commit -S -v --amend' # [g]it [c]ommit -[S] ammend[!]
alias gcsa!='git commit -S -v -a --amend' # [g]it [c]ommit -[S] -[a] ammend[!]
alias gcsan!='git commit -S -v -a --no-edit --amend' # [g]it [c]ommit -[S] -[a] [n]o-edit ammend[!]
