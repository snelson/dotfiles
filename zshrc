# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd
cdpath=($HOME/Code /Volumes/Master/Code)

# use vim as an editor
export EDITOR=vim
export TERM=xterm-256color

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt nocorrectall

# Enable extended globbing
setopt EXTENDED_GLOB

# restore previous cwd
if [[ -f ~/.last_cwd ]]; then
  cd `cat ~/.last_cwd`
fi
_save_last_cwd() {
  echo `pwd` > ~/.last_cwd
}
chpwd_functions=( "${chpwd_functions[@]}" _save_last_cwd )

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# put something like this in this file
# export GIT_AUTHOR_NAME="Scotty and Andy" GIT_AUTHOR_EMAIL="scotty+andy@kajabi.com"
if [[ -s "$HOME/.git_authors" ]] ; then source "$HOME/.git_authors" ; fi

# Setup for chruby

source /usr/local/share/chruby/chruby.sh

source /usr/local/share/chruby/auto.sh

chruby ruby-2.2.0

