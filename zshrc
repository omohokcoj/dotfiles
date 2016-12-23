source ~/.zplug/init.zsh

zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/rake-fast", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/rvm", from:oh-my-zsh

zplug load

_parse_git_branch() {
  local branch
  branch=$(git branch 2> /dev/null | grep '\*' | cut -c 3- | sed 's/[()]//g')
  if [[ "$branch" ]]; then
    if [[ "$branch" == "HEAD"* ]]; then
      branch=$(echo $branch | tail -c 8)
    else
      branch=$(echo $branch | cut -f 1,2 -d '-')
    fi
    echo " ($branch)"
  fi
}

setopt PROMPT_SUBST
PROMPT='%n%f@%m%f %F{green}%1~%f%F{yellow}$(_parse_git_branch)%f %# '

#  History
export HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# vi mode
bindkey -v

# excape squale brackets in rake task
alias rake='noglob rake'
