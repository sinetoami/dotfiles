## instant zsh
source ~/.zsh/plugins/shrink-path.plugin.zsh
source ~/instant-zsh.zsh
instant-zsh-pre "%b%4F$(shrink_path --fish)%f"$'\n'"%b%5F❯%f "

export ZSH=$HOME/.zsh
HISTFILE=~/.zsh_history
HISTSIZE=80000
SAVEHIST=80000
HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g"

plugins=(git)
files=(aliases envvars bindkeys)
source $ZSH/my-zsh.sh
instant-zsh-post
