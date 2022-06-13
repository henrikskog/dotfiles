export ZSH="/Users/henrik/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?

plugins=(
  zsh-autosuggestions
  macos
)

source $ZSH/oh-my-zsh.sh

#  Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi


zle -N fzf-redraw-prompt    # give me my $PS1 back
 zle -N fkill_widget

bindkey '^k'  fkill_widget    #ctrl+k

source ~/dev/shell/scripts/functions



# FZF
 export FZF_CTRL_T_COMMAND="fd --hidden --follow --exclude \".git\" --exclude node_modules . ."
 export FZF_ALT_C_COMMAND="fd -t d --hidden --follow --exclude \".git\" --exclude node_modules . ."
 bindkey "ç" fzf-cd-widget
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

export EC2="ec2-user@3.250.26.252"

export GOPATH=/Users/henrik/go

# Add Go to PATH
export PATH=$GOPATH/bin:/usr/local/go/bin:~/.local/bin:$PATH
export PATH="/Users/henrik/Library/Python/3.9/bin:$PATH"

# Add custom functions to path
export PATH=~/.zfunc:$PATH

export LANG="nb_NO.UTF-8"
export LC_ALL="nb_NO.UTF-8"
export LC_CTYPE="nb_NO.UTF-8"
export LESSCHARSET=utf-8

alias lg=lazygit
alias copy="tr -d '\n' | pbcopy"
alias cdroot='cd $(git rev-parse --show-toplevel)'
alias gitor='git remote -v | awk "/origin.*push/ {print $2}" | xargs open'



fpath=( ~/.zfunc "${fpath[@]}" )
autoload -U $fpath[1]/*(.:t)

source /Users/henrik/.config/broot/launcher/bash/br
source "$(brew --prefix)/etc/profile.d/z.sh"

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
