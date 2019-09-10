export ZSH=$HOME/.zsh

HISTFILE=~/.zsh_history
HISTSIZE=80000
SAVEHIST=80000
HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g"

plugins=(git)
files=(aliases envvars bindkeys)
source $ZSH/my-zsh.sh
source ~/.purezinc
# source ~/.purepower
