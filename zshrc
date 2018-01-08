source ~/.zplug/init.zsh

zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/rake-fast", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/asdf", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"

zplug load

setopt PROMPT_SUBST
PROMPT='%n%f@%m%f %F{green}%1~%f%F{yellow}$(git_current_branch_short)%f %# '

# vi mode
bindkey -v

# excape squale brackets in rake task
alias rake='noglob rake'

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
