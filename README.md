# Dotfiles

Personal configuration files for macOS development.

## What's Included

- **Shell**: zsh with aliases and Starship prompt
- **Editor**: Neovim with lazy.nvim, LSP, Treesitter, and Telescope
- **Terminal**: tmux configuration
- **Git**: config, aliases, and global ignore
- **Claude Code**: global settings and preferences

## Prerequisites

- macOS
- [Homebrew](https://brew.sh)

## Installation

```sh
git clone https://github.com/snelson/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake setup
```

This runs `brew bundle` to install dependencies, then symlinks config files to their expected locations.

To install only the dotfiles (skip Homebrew):

```sh
rake install
```

## Structure

```
dotfiles/
├── Brewfile          → Homebrew dependencies
├── Rakefile          → Installation tasks
├── aliases           → ~/.aliases (shell aliases)
├── gitconfig.erb     → ~/.gitconfig (generated from template)
├── gitignore         → ~/.gitignore
├── tmux.conf         → ~/.tmux.conf
├── zlogin            → ~/.zlogin
├── zshrc             → ~/.zshrc
├── config/
│   ├── nvim/         → ~/.config/nvim/
│   └── starship.toml → ~/.config/starship.toml
└── claude/
    ├── CLAUDE.md     → ~/.claude/CLAUDE.md
    └── settings.json → ~/.claude/settings.json
```

## Key Tools

| Tool | Purpose |
|------|---------|
| [Neovim](https://neovim.io) | Editor |
| [Starship](https://starship.rs) | Shell prompt |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast search |
| [fd](https://github.com/sharkdp/fd) | Fast find |
