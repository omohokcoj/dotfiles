source ~/.zplug/init.zsh

zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/rake-fast", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/rvm", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh

zplug load

setopt PROMPT_SUBST
PROMPT='%n%f@%m%f %F{green}%1~%f%F{yellow}$(git_current_branch_short)%f %# '

export GOPATH=$HOME/Documents/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# tmux detected broken kqueue
export EVENT_NOKQUEUE=1

# vi mode
bindkey -v

# excape squale brackets in rake task
alias rake='noglob rake'
