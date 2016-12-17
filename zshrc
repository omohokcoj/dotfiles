source ~/.zplug/init.zsh

export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh # autojump
# [[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"  # This loads nvm

parse_git_branch() {
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
PROMPT='%n%f@%m%f %F{green}%1~%f%F{yellow}$(parse_git_branch)%f %# '

# vi mode
bindkey -v
