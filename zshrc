source ~/.zplug/init.zsh

zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/rake-fast", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh

zplug load

export PATH=/usr/local/bin:$PATH
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh # autojump
# [[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"  # This loads nvm

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

# vi mode
bindkey -v

#  History
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
