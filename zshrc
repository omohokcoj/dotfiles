source ~/.zsh/oh-my-zsh/plugins/asdf/asdf.plugin.zsh
source ~/.zsh/oh-my-zsh/plugins/autojump/autojump.plugin.zsh
source ~/.zsh/oh-my-zsh/lib/git.zsh
source ~/.zsh/oh-my-zsh/lib/history.zsh
source ~/.zsh/oh-my-zsh/lib/completion.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt PROMPT_SUBST
PROMPT='%n%f@%m%f %F{green}%1~%f%F{yellow}$(git_current_branch_short)%f %# '

# vi mode
bindkey -v

# escape square brackets in rake task
alias rake='noglob spring rake'
alias rspec='spring rspec'
alias vim="nvim"

# enable completion
autoload -Uz compinit && compinit

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export ERL_AFLAGS="-kernel shell_history enabled"

[ -f ~/miniconda3/etc/profile.d/conda.sh ] && source ~/miniconda3/etc/profile.d/conda.sh
