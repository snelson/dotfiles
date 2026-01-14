# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd
cdpath=($HOME/Code /Volumes/Master/Code)

# use neovim as an editor
export EDITOR=nvim
export VISUAL=nvim
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

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS      # ignore duplicate entries
setopt HIST_IGNORE_SPACE     # ignore commands starting with space
setopt SHARE_HISTORY         # share history between sessions
setopt APPEND_HISTORY        # append to history file
setopt INC_APPEND_HISTORY    # add commands immediately

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
  cd "$(cat ~/.last_cwd)" 2>/dev/null || true
fi
_save_last_cwd() {
  printf '%s' "$PWD" > ~/.last_cwd
}
chpwd_functions=( "${chpwd_functions[@]}" _save_last_cwd )

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# git authors for pairing
[[ -s "$HOME/.git_authors" ]] && source "$HOME/.git_authors"

# Zoxide (smarter cd)
eval "$(zoxide init zsh)"

# Starship prompt (must be at end)
eval "$(starship init zsh)"
